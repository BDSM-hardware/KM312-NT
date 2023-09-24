v 20201216 2
C 40000 40000 0 0 0 title-bordered-A4.sym
C 46900 40800 1 0 0 spice-subcircuit-LL-1.sym
{
T 47000 41100 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 47000 41200 5 10 1 1 0 0 1
refdes=A1
T 47000 40900 5 10 1 1 0 0 1
model-name=transfo
}
C 48400 43700 1 0 0 spice-subcircuit-IO-1.sym
{
T 49300 44100 5 10 0 1 0 0 1
device=spice-IO
T 49250 43950 5 10 1 1 0 0 1
refdes=P7
}
C 41600 46400 1 180 0 spice-subcircuit-IO-1.sym
{
T 40700 46000 5 10 0 1 180 0 1
device=spice-IO
T 40750 46150 5 10 1 1 180 0 1
refdes=P4
}
C 41600 45400 1 180 0 spice-subcircuit-IO-1.sym
{
T 40700 45000 5 10 0 1 180 0 1
device=spice-IO
T 40750 45150 5 10 1 1 180 0 1
refdes=P1
}
C 41600 44500 1 180 0 spice-subcircuit-IO-1.sym
{
T 40700 44100 5 10 0 1 180 0 1
device=spice-IO
T 40750 44250 5 10 1 1 180 0 1
refdes=P2
}
C 41600 43900 1 180 0 spice-subcircuit-IO-1.sym
{
T 40700 43500 5 10 0 1 180 0 1
device=spice-IO
T 40750 43650 5 10 1 1 180 0 1
refdes=P3
}
C 48400 45500 1 0 0 spice-subcircuit-IO-1.sym
{
T 49300 45900 5 10 0 1 0 0 1
device=spice-IO
T 49250 45750 5 10 1 1 0 0 1
refdes=P5
}
C 48400 44500 1 0 0 spice-subcircuit-IO-1.sym
{
T 49300 44900 5 10 0 1 0 0 1
device=spice-IO
T 49250 44750 5 10 1 1 0 0 1
refdes=P6
}
C 48400 42700 1 0 0 spice-subcircuit-IO-1.sym
{
T 49300 43100 5 10 0 1 0 0 1
device=spice-IO
T 49250 42950 5 10 1 1 0 0 1
refdes=P8
}
C 41400 44100 1 0 0 nc-right-1.sym
{
T 41500 44600 5 10 0 0 0 0 1
value=NoConnection
T 41500 44800 5 10 0 0 0 0 1
device=DRC_Directive
}
C 41400 43500 1 0 0 nc-right-1.sym
{
T 41500 44000 5 10 0 0 0 0 1
value=NoConnection
T 41500 44200 5 10 0 0 0 0 1
device=DRC_Directive
}
C 42200 45100 1 90 0 coil-2.sym
{
T 41700 45300 5 10 0 0 90 0 1
device=COIL
T 41900 45300 5 10 1 1 90 0 1
refdes=L3
T 41500 45300 5 10 0 0 90 0 1
symversion=0.1
}
C 47900 44800 1 90 0 coil-2.sym
{
T 47400 45000 5 10 0 0 90 0 1
device=COIL
T 47600 45000 5 10 1 1 90 0 1
refdes=L1
T 47200 45000 5 10 0 0 90 0 1
symversion=0.1
}
C 47900 43000 1 90 0 coil-2.sym
{
T 47400 43200 5 10 0 0 90 0 1
device=COIL
T 47600 43200 5 10 1 1 90 0 1
refdes=L2
T 47200 43200 5 10 0 0 90 0 1
symversion=0.1
}
C 43000 44300 1 0 0 kmutual-1.sym
{
T 43300 44750 5 10 1 1 0 0 1
refdes=K1
T 43300 44600 5 10 1 1 0 0 1
value=0.99
T 43300 44395 5 10 1 1 0 0 1
inductors=L1 L2
T 43000 44290 5 10 0 1 0 0 1
device=K
}
C 44200 44300 1 0 0 kmutual-1.sym
{
T 44500 44750 5 10 1 1 0 0 1
refdes=K2
T 44500 44600 5 10 1 1 0 0 1
value=0.99
T 44500 44395 5 10 1 1 0 0 1
inductors=L2 L3
T 44200 44290 5 10 0 1 0 0 1
device=K
}
C 45500 44300 1 0 0 kmutual-1.sym
{
T 45800 44750 5 10 1 1 0 0 1
refdes=K3
T 45800 44600 5 10 1 1 0 0 1
value=0.99
T 45800 44395 5 10 1 1 0 0 1
inductors=L1 L3
T 45500 44290 5 10 0 1 0 0 1
device=K
}
N 41400 46100 42100 46100 4
N 41400 45100 42100 45100 4
N 47800 45800 48600 45800 4
N 47800 44800 48600 44800 4
N 47800 44000 48600 44000 4
N 47800 43000 48600 43000 4
