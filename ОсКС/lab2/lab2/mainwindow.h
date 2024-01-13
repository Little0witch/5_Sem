#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QtSerialPort/QSerialPort>
#include <QSerialPortInfo>
#include <QMap>
#include <QMessageBox>
#include <QtWidgets>
#include <QLineEdit>

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
    QString getBitStaffing(QString data);
    QString deBitStaffing(QString data);
    QString showBitStaffing(QString data);
    QString getSourceAddress();

private slots:
    void readData();

    void on_changeCom_activated();
    void on_changeBits_currentIndexChanged(int index);
    void on_InputBox_returnPressed();
    void on_buttonUpdate_clicked();

private:
    QSerialPort serialPort;
    QSerialPort serialPortNew;
    QMap<QString, QChar> portMap;
    Ui::MainWindow *ui;
    QString flag;
    QString destinationAddress;
    QString sourceAddress;
    QChar FCS;
};
#endif // MAINWINDOW_H
