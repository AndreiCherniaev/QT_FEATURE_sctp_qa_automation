#include <QtNetwork>
#include "client.h"

const quint16 my_port= 2222;

Client::Client(QObject *parent)
    : QObject(parent)
    , socket(new QSctpSocket(this))
{
    //my_SBC_BCN.setAddress(qgetenv("SBC_BCN"));
#warning for debug only
    my_SBC_BCN.setAddress("127.0.0.1");
    
    connect(socket, &QAbstractSocket::errorOccurred, this, &Client::displayError);
    
    socket->setMaximumChannelCount(1);
    socket->connectToHost(my_SBC_BCN, my_port, QIODeviceBase::ReadWrite);
    if(!socket->waitForConnected()){
        qWarning() << "Error: " << socket->errorString();
    }

    //TimerCallback();
    QTimer *timer = new QTimer(this);
    connect(timer, &QTimer::timeout, this, &Client::TimerCallback);
    timer->start(1000);
}


void Client::TimerCallback(){
    //qDebug() << "state" << socket->state();
    QByteArray datagram = "Multicast message1 ";
    bool res = socket->writeDatagram(QNetworkDatagram(datagram, my_SBC_BCN));
    socket->waitForBytesWritten();
    //qint64 bytesWritten = socket->write("Client2Server");
    qDebug() << "is written" << res;

    QByteArray datagram2 = "Multicast message2 ";
    res = socket->writeDatagram(QNetworkDatagram(datagram2, my_SBC_BCN));
    socket->waitForBytesWritten();
    //qint64 bytesWritten = socket->write("Client2Server");
    qDebug() << "is written" << res;
}


void Client::displayError(QAbstractSocket::SocketError socketError)
{
    switch (socketError) {
    case QAbstractSocket::RemoteHostClosedError:
        break;
    case QAbstractSocket::HostNotFoundError:
        qWarning() << "The host was not found. Please check the "
                                    "host name and port settings.";
        break;
    case QAbstractSocket::ConnectionRefusedError:
        qWarning() << "The connection was refused by the peer. "
                                    "Make sure the fortune server is running, "
                                    "and check that the host name and port "
                                    "settings are correct.";
        break;
    default:
        qWarning() << "The following error occurred:" << socket->errorString();
    }
}
