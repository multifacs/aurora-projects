#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>
#include <QString>
#include <cmath>
#include <random>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int count READ getCount WRITE setCount NOTIFY countChanged)
public:
    explicit Counter(QObject *parent = nullptr);
    Q_INVOKABLE int getCount() { return m_count; };
    Q_INVOKABLE double getSin() { return sin(m_count); };
    Q_INVOKABLE double getCos() { return cos(m_count); };
    Q_INVOKABLE double getTan() { return tan(m_count); };
    Q_INVOKABLE double getCot() {
        if (sin(m_count) != 0) {
            return cos(m_count)/sin(m_count);
        }
        return -1;
    };
    Q_INVOKABLE void inc() { m_count = random(); };
    Q_INVOKABLE void reset() { m_count = 0; };

    void setCount(const int temp) { m_count = temp; emit countChanged(); };

signals:
    void countChanged();


private:
    int m_count = 0;
};

#endif // COUNTER_H
