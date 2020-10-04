# Camión de transporte

Una empresa de transporte quiere administrar mejor las cargas que lleva un camión.

Para eso requiere un sistema que le permita planificar qué cosas debe llevar el camión sin sobrepasar su capacidad. Por otro lado, las cosas que transporta tienen un nivel de peligrosidad. Este nivel es usado para impedir que cosas que superen cierto nivel de peligrosidad circulen en determinadas rutas.

## El camión
Se pide que el camión entienda los siguientes mensajes:

* `cargar(cosa)` y `descargar(cosa)`: para manejar qué tiene;
* `pesoTotal()`: es la suma del peso del camión vacío (tara) y su carga. La tara del camión es de 1 tonelada (1000 kilogramos);
* `excedidoDePeso()`: indica si el peso total es superior al peso máximo. El cual es de 2.5 toneladas;
* `objetosPeligrosos(nivel)`: todos los objetos cargados que superan el nivel de peligrosidad indicados por el valor del parámetro;
* `objetosMasPeligrososQue(cosa)`: todos los objetos cargados que son más peligrosos que la cosa;
* `puedeCircularEnRuta(nivelMaximoPeligrosidad)` Puede circular si ninguna cosa que transporta supera el `nivelMaximoPeligrosidad`.

## Las cosas
De las cosas que puede transportar el camión nos interesa el peso y la peligrosidad:

* Knight Rider: pesa 500 kilos y su nivel de peligrosidad es 10.
* Bumblebee: pesa 800 kilos y su nivel de peligrosidad es 15 si está transformado en auto o 30 si está como robot.
* Paquete de ladrillos: cada ladrillo pesa 2 kilos, la cantidad de ladrillos que tiene puede variar. La peligrosidad es 2.
* Arena a granel: el peso es variable, la peligrosidad es 1.
* Batería antiaérea : el peso es 300 kilos si está con los misiles o 200 en otro caso. En cuanto a la peligrosidad es 100 si está con los misiles y 0 en otro caso.
* Contenedor portuario: un contenedor puede tener otras cosas adentro. El peso es 100 + la suma de todas las cosas que estén adentro. Es tan peligroso como el objeto más peligroso que contiene. Si está vacío, su peligrosidad es 0.
* Residuos radioactivos: el peso es variable y su peligrosidad es 200.
* Embalaje de seguridad: es una cobertura que envuelve a cualquier otra cosa. El peso es el peso de la cosa que tenga adentro. El nivel de peligrosidad es la mitad del nivel de peligrosidad de lo que envuelve.

## Agregados al camión

Se pide agregar estos mensajes al camión:

* `tieneAlgoQuePesaEntre(min, max)`: indica si el peso de alguna de las cosas que tiene el camión está en ese intervalo;
* `cosaMasPesada()`: la cosa más pesada que tenga el camión. Ojo que lo que se pide es _la cosa_ y no su peso.
* `totalBultos()`: la suma de la cantidad de bultos que está transportando. KnightRider, arena a granel y residuos radioactivos son 1 bulto. Bumblebee y embalaje de seguridad son dos. Paquete de ladrillos es 1 hasta 100 ladrillos, 2 de 101 a 300, 3 301 o más. Batería antiaérea: 1 si no tiene misiles, 2 si tiene. Contenedor portuario: 1 + los bultos que tiene adentro.
* `pesos()`: devuelve una lista con _los pesos_ de cada cosa que tiene el camión.

Agregar la posibilidad de que al cargar una cosa en el camión, esta pueda sufrir cambios. Estos cambios tienen que ocurrir automáticamente cuando, por ejemplo, se ejecuta `camion.cargar(arenaGranel)`. Cómo debería reaccionar cada cosa:

- KnightRider: no hace nada;
- Bumblebee: pasa a robot;
- paquete de ladrillos: agrega 12 ladrillos;
- arena a granel: agrega 20 kilos;
- batería antiaérea: carga misiles;
- contenedor portuario: hace que reaccione cada una de las cosas que tiene adentro;
- residuos radioactivos: agrega 15 kilos;
- embalaje de seguridad: nada.
