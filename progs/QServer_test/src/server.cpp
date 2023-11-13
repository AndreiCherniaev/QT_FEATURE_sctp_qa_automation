#include <QtNetwork>
#include <QtCore>
#include "server.h"

Server::Server(QObject *parent)
    : QObject(parent)
{
    initServer();

    fortunes << tr("Yofgjfgjture.")
             << tr("You've mrrow.")
             << tr("You will loud noise.")
             << tr("You will hugry again another hour.")
             << tr("You have mail.")
             << tr("You cnnot kll without injuring eternity.")
             << tr("Compuers are not. They thnk they are.");

    connect(myServer, &QTcpServer::newConnection, this, &Server::sendFortune);
}


void Server::initServer(){
    myServer = new QSctpServer(this);
    QHostAddress ipAddress= QHostAddress::LocalHost;//QHostAddress::Any
    if(!myServer->listen(ipAddress, 2222)){
        qWarning() << "err" << myServer->errorString();
        return;
    }

    qDebug() << "server IP" << ipAddress << "port" << myServer->serverPort();
}

QByteArray readBlock;
void Server::sendFortune(){
    QByteArray block;
    QDataStream out(&block, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_6_5);

    out << fortunes[QRandomGenerator::global()->bounded(fortunes.size())];

    QSctpSocket *clientConnection = myServer->nextPendingDatagramConnection();
    connect(clientConnection, &QAbstractSocket::disconnected,
            clientConnection, &QObject::deleteLater);

    //clientConnection->write(block);
    clientConnection->waitForReadyRead();
    QNetworkDatagram datagram = clientConnection->readDatagram(); //readBlock= clientConnection->read(80);
    qDebug().nospace() << ": " << datagram.data() << " from " << datagram.senderAddress() << ":" << datagram.senderPort();
    //clientConnection->disconnectFromHost();
}
