#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QtSerialPort/QSerialPort>
#include <QSerialPortInfo>
#include <QRandomGenerator>
#include <QMap>
#include <QMessageBox>
#include <QtWidgets>
#include <QLineEdit>
#include <QtGlobal>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    void initComPort();
    QString addDataToFull(QString& data);
    QString getBitStaffing(QString frame);
    QString deBitStaffing(QString data);
    QString showBitStaffing(QString data);
    QString getSourceAddress();
    QString getFCS(QString data);
    QString getFrameWithoutFCS(QString data);
    void generateDistortion(QString& data);
    QString correctionDistortion(QString data, QString correctFCS);
    void inversionBit(QString& data, int position);
    QString getCorrectFCS(QString data);
    QString getData(QString frame);



private slots:
    void readData();

    void on_changeCom_activated();
    void on_changeBits_currentIndexChanged(int index);
    void on_InputBox_returnPressed();
    void on_buttonUpdate_clicked();

private:
    QSerialPort serialPort;
    QMap<QString, QChar> portMap;
    Ui::MainWindow *ui;
    QString flag;
    QString destinationAddress;
    QString sourceAddress;
    QString FCS;
    int chekFCS[4][8]= {
        {0, 2, 4, 6, 8, 10, 12, 14},
        {1, 2, 5, 6, 9, 10, 13, 14},
        {3, 4, 5, 6, 11, 12, 13, 14},
        {7, 8, 9, 10, 11, 12, 13, 14},
    };



};
#endif // MAINWINDOW_H
