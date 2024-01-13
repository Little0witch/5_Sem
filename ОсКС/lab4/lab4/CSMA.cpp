#include <QRandomGenerator>

bool IsBusyChannel()
{
    int randomValue = QRandomGenerator::global()->bounded(100);
    return (randomValue <= 69); // 70% вероятность занятости
}

bool detectCollision()
{
    int randomValue = QRandomGenerator::global()->bounded(100);
    return (randomValue <= 29); // 30% вероятность коллизии
}

int makeBackoff(int numCollision)
{
    if (numCollision>10)
        numCollision = 10;
    int randomValue = QRandomGenerator::global()->bounded(pow(2,numCollision));
    return randomValue;
}
