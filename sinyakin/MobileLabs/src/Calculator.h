#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <QObject>
#include <QString>

class Calculator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double m_num_1 READ getNum1 WRITE setNum1 NOTIFY num1Changed)
    Q_PROPERTY(double m_num_2 READ getNum2 WRITE setNum2 NOTIFY num2Changed)
public:
    explicit Calculator(QObject *parent = nullptr);
    Q_INVOKABLE double getNum1() { return m_num_1; };
    Q_INVOKABLE double getNum2() { return m_num_2; };

    Q_INVOKABLE double add() { return m_num_1 + m_num_2; };
    Q_INVOKABLE double sub() { return m_num_1 - m_num_2; };
    Q_INVOKABLE double div() {
        if (m_num_2 == 0) return -1;

        return m_num_1 / m_num_2;
    };
    Q_INVOKABLE double mul() { return m_num_1 * m_num_2; };

    void setNum1(const double temp) { m_num_1 = temp; emit num1Changed(); };
    void setNum2(const double temp) { m_num_2 = temp; emit num2Changed(); };

signals:
    void num1Changed();
    void num2Changed();


private:
    double m_num_1 = 0;
    double m_num_2 = 0;
};

#endif // CALCULATOR_H
