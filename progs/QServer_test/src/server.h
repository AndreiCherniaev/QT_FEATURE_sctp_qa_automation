#pragma once
#include <QObject>
#include <QString>
#include <QList>

#include <QSctpServer>
#include <QSctpSocket>

QT_BEGIN_NAMESPACE
class QSctpServer;
QT_END_NAMESPACE

class Server : public QObject
{
    Q_OBJECT

public:
    explicit Server(QObject *parent = nullptr);

private slots:
    void sendFortune();

private:
    void initServer();

    QSctpServer *myServer = nullptr;
    QList<QString> fortunes;
};
