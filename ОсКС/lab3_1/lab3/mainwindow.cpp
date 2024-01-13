#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QRegularExpression>
#include <QRegularExpressionValidator>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    flag = "00010000";
    destinationAddress = "0000";
    ui->setupUi(this);
    setWindowTitle("ОКС");
    setFixedSize(785, 352);
    initComPort();

    ui->changeBits->setCurrentIndex(3);

    // Установите ограничение на ввод только "0" и "1" в поле InputBox
    QRegularExpression rx("[01]*");
    QValidator *validator = new QRegularExpressionValidator(rx, this);
    ui->InputBox->setValidator(validator);

    connect(&serialPort, &QSerialPort::readyRead, this, &MainWindow::readData);
}

MainWindow::~MainWindow()
{
    if(serialPort.isOpen())
        serialPort.close();
    delete ui;
}

//инициализация портов
void MainWindow::initComPort()
{
    QList<QSerialPortInfo> ports = QSerialPortInfo::availablePorts();
    if (ports.isEmpty()){
        QMessageBox::information(this, "Отсутствуют порты", "Нет доступных портов.");
        exit(3);
    }
    ui->changeCom->clear();
    for (const QSerialPortInfo& port : ports) {
        QString tmpNum = port.portName();
        ui->changeCom->addItem(tmpNum[3]);
        portMap[port.portName()] = tmpNum[3];
    }
    serialPort.setBaudRate(QSerialPort::Baud9600);
    serialPort.setDataBits(QSerialPort::Data8);
    serialPort.setStopBits(QSerialPort::OneStop);
    serialPort.setParity(QSerialPort::NoParity);
    serialPort.setFlowControl(QSerialPort::NoFlowControl);

    for(const QSerialPortInfo& port : ports){
        serialPort.setPortName(port.portName());
        if (serialPort.open(QIODevice::ReadWrite))
        break;
    }

    ui->changeCom->setCurrentText(portMap[serialPort.portName()]);
    ui->StatusBox->append("Скорость: " + QString::number(serialPort.baudRate()));

    sourceAddress = getSourceAddress();
}

//чтение данных из порта
void MainWindow::readData()
{
    QByteArray data = serialPort.readAll();
    QString message = QString::fromUtf8(data);
    QString frame;
    QString chekFlag = " ";
    QString outputData;
    //cut frame
    while (message.length() > 1)
    {
        int flagPosition = message.indexOf(chekFlag);
        //last frame
        if (flagPosition != -1)
        {
            frame = message.left(flagPosition+6);
            message.remove(0, flagPosition + 6);
        }

        QString showFrame = showBitStaffing(frame);

        showFrame.remove(showFrame.length() - 5, 5);

        QString correctFCS = getCorrectFCS(frame);

        frame.remove(flagPosition, 6);

        QString afterDeBitStaffing = deBitStaffing(frame);

        QString receivedData = getData(afterDeBitStaffing);

        QString newFCS = getFCS(receivedData);

        showFrame = showFrame + " " + newFCS;

        ui->StatusBox->append(showFrame);

        outputData += correctionDistortion(receivedData, correctFCS);

        receivedData.clear();
    }

    ui->outputBox->append(outputData);

//    QString chekFlag = flag + destinationAddress;
//    int flagPosition;
//    QString frame;
//    QString deBitStaffingString;
//    QString receivedData;
//    //здесь начинается нарезка на пакеты и потом дебитстафиннг
//    while (message.length()>0)
//    {
//        message = message.remove(0,flag.length());
//        flagPosition = message.indexOf(chekFlag);
//        //это помледний или единственный пакет
//        if (flagPosition == -1)
//        {
//        frame = message;
//        message = message.remove(0, message.length());
//        }
//        //разделяем очередной пакет
//        else
//        {
//        frame = message.left(flagPosition);
//        message = message.remove(0, flagPosition);
//        }

//        QString showFrame = flag + frame;
//        showFrame.remove(showFrame.length()-5, 5);
//        //де-бит-стаффинг
//        deBitStaffingString = deBitStaffing(frame);
//        //проверка FCS пришедшего пакета
//        QString correctFCS = getCorrectFCS(deBitStaffingString);
//        QString deBitData = getData(deBitStaffingString);
//        showFrame += getFCS(deBitData);
//        ui->StatusBox->append(showBitStaffingAndFCS(showFrame));
//        //исправленный пакет
//        receivedData += correctionDistortion(deBitData, correctFCS);
//        receivedData +=correctData;
//    }

//    ui->outputBox->append(receivedData);
//    ui->StatusBox->append("");
//    data.clear();
//    message.clear();
//    frame.clear();
//    deBitStaffingString.clear();
//    receivedData.clear();
}

//запись данных в порт
void MainWindow::on_InputBox_returnPressed()
{
    QString inputText = ui->InputBox->text();
    ui->StatusBox->append("Передано: " + QString::number(inputText.size()) + " байтов");
    QString resultBitsStaffing;
    QString frame;
    while (inputText.length()>0)
    {
        QString tmp_data = addDataToFull(inputText);
        FCS = getFCS(tmp_data);
        generateDistortion(tmp_data);
        frame = getFrameWithoutFCS(tmp_data);
        resultBitsStaffing = getBitStaffing(frame);
        frame = resultBitsStaffing + " " + FCS;
        serialPort.write(frame.toUtf8());
        tmp_data.clear();
        resultBitsStaffing.clear();
        frame.clear();
    }
    ui->InputBox->clear();
}

//обработка изменения кол битов в байте
void MainWindow::on_changeBits_currentIndexChanged(int index)
{
    QSerialPort::DataBits dataBits = QSerialPort::Data8;
    switch (index) {
    case 0:
        dataBits = QSerialPort::Data5;
        break;
    case 1:
        dataBits = QSerialPort::Data6;
        break;
    case 2:
        dataBits = QSerialPort::Data7;
        break;
    case 3:
        dataBits = QSerialPort::Data8;
        break;
    }
    serialPort.setDataBits(dataBits);
}

//обработка изменения порта
void MainWindow::on_changeCom_activated()
{
    QString nowNamePort = serialPort.portName();
    QString newComPort = "COM" + ui->changeCom->currentText();
    QSerialPort serialPortNew;
    serialPortNew.setPortName(newComPort);
    if(!serialPortNew.open(QIODevice::ReadWrite) && nowNamePort!=newComPort)
    {
        QString warningMess = newComPort + " уже занят!";
        QMessageBox::information(this, "Порт занят", warningMess);
        ui->changeCom->setCurrentText(nowNamePort[3]);
        serialPortNew.close();
        return;
    }
    else
    {
        if(serialPort.isOpen())
        {
            serialPort.close();
            serialPortNew.close();
        }
        serialPort.setPortName(newComPort);
        serialPort.open(QIODevice::ReadWrite);
        ui->StatusBox->clear();
        ui->outputBox->clear();
        ui->StatusBox->setText(ui->StatusBox->toPlainText() + "Скорость: " + QString::number(serialPort.baudRate()) + "\n");
        sourceAddress = getSourceAddress();
    }
}

//обновление списка портов
void MainWindow::on_buttonUpdate_clicked()
{
    QString currentComPort = "COM" + ui->changeCom->currentText();
    bool isAvailablePort = false;
    ui->changeCom->clear();
    QList<QSerialPortInfo> ports = QSerialPortInfo::availablePorts();
    for (const QSerialPortInfo& port : ports) {
        if(port.portName() == currentComPort)
        {
        isAvailablePort = true;
        }
        ui->changeCom->addItem(portMap[port.portName()]);
    }
    if(isAvailablePort)
    {
        ui->changeCom->setCurrentText(currentComPort[3]);
    }
    sourceAddress = getSourceAddress();
}

//заполнение доп символами поля Data
QString MainWindow::addDataToFull(QString& data)
{
    QString fullData;
    if (data.length()>16){
        fullData = data.left(16);
    }
    else{
        while (data.length()<16)
        {
        data += 'X';
        }
        fullData = data;
    }
    data.remove(0,16);
    return fullData;
}

//бит-стаффинг
QString MainWindow::getBitStaffing(QString frame)
{
    QString chekFlag = "0001000";
    for (int i = 7; i< frame.length(); i++)
    {
        QString substring = frame.mid(i,7);
        if (chekFlag == substring)
        {
        frame.insert(i+7, '1');
        }
    }
    return frame;
}

//де-бит-стаффинг
QString MainWindow::deBitStaffing(QString data)
{
    QString receivedData;
    receivedData = data;
    QString chekFlag = "0001000";

    for (int i = receivedData.length(); i>= 7; i--)
    {
        QString substring = data.mid(i,7);
        if (chekFlag == substring)
        {
        data.remove(i+7, 1);
        }
    }
    receivedData = data;
    return receivedData;
}

//красивый вывод бит-стаффинга
QString MainWindow::showBitStaffing(QString data)
{
    QString frame = data;
    QString chekFlag = "0001000";
    int lengthData = data.length();

    for (int i = lengthData - 11; i >= 7; i--)
    {
        QString substring = data.mid(i,7);
        if (chekFlag == substring)
        {
        frame.insert(i+7, '(');
        frame.insert(i+9, ')');
        }
    }
    return frame;
}

//сборка пакета из полей
QString MainWindow::getFrameWithoutFCS(QString data)
{
    QString frame;
    frame = flag + destinationAddress + sourceAddress + data;
    return frame;
}

//получение значения Source Address
QString MainWindow::getSourceAddress()
{
    int decimalNumber;
    decimalNumber = portMap[serialPort.portName()].toLatin1() - '0'; // из строки в число
    QString binaryString = QString::number(decimalNumber, 2);
    while (binaryString.length()<4)
    {
        binaryString = "0" + binaryString;
    }
    return binaryString;
}

//высчитывание FCS
QString MainWindow::getFCS(QString data)
{
    QString FCS;
    FCS.clear();
    int sum[4] = {0,0,0,0};
    for(int i=0;i<4;i++)
    {
        for (int j=0; j<8; j++)
        {
            int pos = chekFCS[i][j];
            if (data[pos] == '1')
                sum[i]++;
        }
    }
    for (int i=0; i<4;i++)
    {
        if (sum[i]%2 == 0)
            FCS += '0';
        else
            FCS +='1';
    }
    if (data[15] == '1')
        FCS += '1';
    else
        FCS +='0';
    return FCS;
}

//генерация искажения в Data
void MainWindow::generateDistortion(QString& data)
{
    int randomValue = QRandomGenerator::global()->bounded(100);
    if (randomValue <= 69) {
        int bitIndex = QRandomGenerator::global()->bounded(16);
        inversionBit(data, bitIndex);
    }
}

//инверсия символа
void MainWindow::inversionBit(QString& data, int position)
{
    if (data[position] == '1')
        data[position] = '0';
    else
        data[position] = '1';
}

//исправление искажения
QString MainWindow::correctionDistortion(QString data, QString correctFCS)
{
    //проверка FCS пришедшего пакета
    QString FCSReceivedFrame = getFCS(data);
    QString correctData = data;
    int posDistortion = 0;

    if (correctFCS[0] != FCSReceivedFrame[0])
    {
        posDistortion +=1;
    }
    if (correctFCS[1] != FCSReceivedFrame[1])
    {
        posDistortion +=2;
    }
    if (correctFCS[2] != FCSReceivedFrame[2])
    {
        posDistortion +=4;
    }
    if (correctFCS[3] != FCSReceivedFrame[3])
    {
        posDistortion +=8;
    }
    if (correctFCS[4] != FCSReceivedFrame[4])
    {
        posDistortion +=16;
    }
    if (posDistortion != 0)
    {
     inversionBit(correctData, posDistortion - 1);
    }
    return correctData;
}

//получение поля FCS
QString MainWindow::getCorrectFCS(QString data)
{
    return data.mid(data.length()-5);
}

//получение поля Data
QString MainWindow::getData(QString data)
{
    QString receivedData = data;
    receivedData.remove(0,16);
    return receivedData;
}




