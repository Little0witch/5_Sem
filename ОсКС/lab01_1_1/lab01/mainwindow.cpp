#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    setWindowTitle("ОКС");
    setFixedSize(665, 352);
    initComPort();

    ui->changeBits->setCurrentIndex(3);
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
    ui->StatusBox->setText(ui->StatusBox->toPlainText() + "Скорость: " + QString::number(serialPort.baudRate()) + "\n");
}

void MainWindow::readData()
{
    QByteArray data = serialPort.readAll();
    QString message = QString::fromUtf8(data);

    ui->outputBox->setText(ui->outputBox->toPlainText() + message);
    QTextCursor cursorOutput = ui->outputBox->textCursor();
    cursorOutput.movePosition(QTextCursor::End);
    ui->outputBox->setTextCursor(cursorOutput);

    ui->StatusBox->setText(ui->StatusBox->toPlainText() + "Передано: " + QString::number(data.size()) + " байт\n");
    QTextCursor cursorStatus = ui->StatusBox->textCursor();
    cursorStatus.movePosition(QTextCursor::End);
    ui->StatusBox->setTextCursor(cursorStatus);
}

void MainWindow::on_InputBox_returnPressed()
{
    serialPort.write((ui->InputBox->text() + "\n").toUtf8());
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
}

