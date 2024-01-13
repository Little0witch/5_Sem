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
    FCS = '0';
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

void MainWindow::readData()
{
    QByteArray data = serialPort.readAll();
    QString message = QString::fromUtf8(data);
    QString chekFlag = flag + destinationAddress;
    int flagPosition;
    QString frame;
    QString receivedData;

    //здесь начинается нарезка на пакеты и потом дебитстафиннг
    while (message.length()>0)
    {
        message = message.remove(0,flag.length());
        flagPosition = message.indexOf(chekFlag);
        if (flagPosition == -1)
        {
        frame = message;
        message = message.remove(0, message.length());
        }
        else
        {
        frame = message.left(flagPosition);
        message = message.remove(0, flagPosition);
        }
        receivedData += deBitStaffing(frame);
        frame = flag + frame;
        frame = showBitStaffing(frame);
        ui->StatusBox->append(frame);
    }

    ui->outputBox->append(receivedData);

    frame.clear();
    receivedData.clear();
}

void MainWindow::on_InputBox_returnPressed()
{
    QString inputText = ui->InputBox->text();
    ui->StatusBox->append("Передано: " + QString::number(inputText.size()) + " байтов");
    QString resultBitsStaffing;
    while (inputText.length()>0)
    {
        QString tmpData = inputText.left(16);
        inputText.remove(0,16);
        resultBitsStaffing = getBitStaffing(tmpData);
        serialPort.write(resultBitsStaffing.toUtf8());
        resultBitsStaffing.clear();
    }
    ui->InputBox->clear();
}

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

void MainWindow::on_changeCom_activated()
{
    QString nowNamePort = serialPort.portName();
    QString newComPort = "COM" + ui->changeCom->currentText();
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

QString MainWindow::getBitStaffing(QString data)
{
    QString frame;
    if (data.length()<= 16){
        while (data.length()<16)
        {
        data += "X";
        }
        frame = flag + destinationAddress + sourceAddress + data + FCS;
    }
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

QString MainWindow::deBitStaffing(QString data)
{
    QString receivedData;
    receivedData = data;
    QString chekFlag = "0001000";

    for (int i = receivedData.length(); i>= 0; i--)
    {
        QString substring = data.mid(i,7);
        if (chekFlag == substring)
        {
        data.remove(i+7, 1);
        }
    }
    receivedData = data;

    receivedData.remove(0,8);
    receivedData.remove(receivedData.length() - 1, 1);

    receivedData.remove(QChar('X'));
    return receivedData;
}

QString MainWindow::showBitStaffing(QString data)
{
    QString frame = data;
    QString chekFlag = "0001000";
    int lengthData = data.length();

    for (int i = lengthData; i >= 7; i--)
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
