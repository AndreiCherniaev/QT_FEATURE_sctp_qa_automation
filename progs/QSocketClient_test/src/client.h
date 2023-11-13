#pragma once

#include <QDataStream>
#include <QSctpSocket>

class Client : public QObject
{
    Q_OBJECT

public:
    explicit Client(QObject *parent = nullptr);

private slots:
    void displayError(QAbstractSocket::SocketError socketError);
    void TimerCallback();

private:
    QSctpSocket *socket = nullptr;
    QString currentFortune;
    QHostAddress my_SBC_BCN;
};

