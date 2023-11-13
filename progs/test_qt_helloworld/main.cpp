//Uncoment to test Qt and get "Incompatible processor. This Qt build requires the following features: sse2" on X86 no-SSE2 CPU
#include <QCoreApplication>
#include <cstdio>

int main(int argc, char *argv[])
{
    
    //Uncoment if you want get information does SSE2 supported by your CPU. I test it.
    //on X86_64 this code says "machine sse2"
    //on X86 no-SSE2 this code says "machine no see2"
    
    int count= 0;
    if (__builtin_cpu_supports ("sse2")){ //https://gcc.gnu.org/onlinedocs/gcc-4.8.5/gcc/X86-Built-in-Functions.html
         printf("machine sse2");
    }else printf("machine no see2");
    
    //Uncoment to test Qt and get "Incompatible processor. This Qt build requires the following features: sse2" on X86 no-SSE2 CPU
    QCoreApplication a(argc, argv);
    
    qDebug() << "qt_helloworld";
    
    return a.exec();
}
