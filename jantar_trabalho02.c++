
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <queue>
#include <chrono>

using namespace std;

mutex LifeMutex;
condition_variable LifeEspera;

queue<int> LifeFila;

bool LifeGarfos[5] = {false, false, false, false, false};
int LifeRefeicoes[5] = {0, 0, 0, 0, 0};

void pegarGarfos(int LifeID) {

    unique_lock<mutex> LifeLock(LifeMutex);

    LifeFila.push(LifeID);

    cout << "Filosofo " << LifeID
         << " entrou na fila." << endl;

    LifeEspera.wait(LifeLock, [&]() {

        int LifeG1 = LifeID;
        int LifeG2 = (LifeID + 1) % 5;

        return LifeFila.front() == LifeID &&
               !LifeGarfos[LifeG1] &&
               !LifeGarfos[LifeG2];
    });

    LifeFila.pop();

    LifeGarfos[LifeID] = true;
    LifeGarfos[(LifeID + 1) % 5] = true;

    cout << "Filosofo " << LifeID
         << " esta comendo." << endl;

    LifeEspera.notify_all();
}

void devolverGarfos(int LifeID) {

    lock_guard<mutex> LifeLock(LifeMutex);

    LifeGarfos[LifeID] = false;
    LifeGarfos[(LifeID + 1) % 5] = false;

    LifeRefeicoes[LifeID]++;

    cout << "Filosofo " << LifeID
         << " terminou de comer." << endl;

    LifeEspera.notify_all();
}

void filosofo(int LifeID) {

    for (int LifeI = 0; LifeI < 3; LifeI++) {

        cout << "Filosofo " << LifeID
             << " esta pensando." << endl;

        this_thread::sleep_for(
            chrono::milliseconds(200)
        );

        pegarGarfos(LifeID);

        this_thread::sleep_for(
            chrono::milliseconds(300)
        );

        devolverGarfos(LifeID);
    }
}

int main() {

    thread LifeThreads[5];

    cout << "Inicio do jantar dos filosofos!" << endl;

    // Criando os cinco filosofos
    for (int LifeI = 0; LifeI < 5; LifeI++) {
        LifeThreads[LifeI] = thread(filosofo, LifeI);
    }

    // Esperando todos terminarem
    for (int LifeI = 0; LifeI < 5; LifeI++) {
        LifeThreads[LifeI].join();
    }

    cout << "\n===== TESTES =====" << endl;

    int LifeTotal = 0;
    bool LifeTodosComeram = true;

    for (int LifeI = 0; LifeI < 5; LifeI++) {

        cout << "Filosofo " << LifeI
             << " comeu " << LifeRefeicoes[LifeI]
             << " vezes." << endl;

        LifeTotal += LifeRefeicoes[LifeI];

        if (LifeRefeicoes[LifeI] != 3) {
            LifeTodosComeram = false;
        }
    }

    cout << "\nTotal de refeicoes: "
         << LifeTotal << "/15" << endl;

    if (LifeTodosComeram && LifeTotal == 15) {
        cout << "[OK] Todos conseguiram comer 3 vezes!" << endl;
    } else {
        cout << "[ERRO] Nem todos conseguiram comer." << endl;
    }

    cout << "Fim do programa!" << endl;

    return 0;
}
