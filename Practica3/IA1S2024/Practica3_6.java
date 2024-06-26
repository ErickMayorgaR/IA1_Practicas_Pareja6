package IA1S2024;

import robocode.*;
import static robocode.util.Utils.normalRelativeAngleDegrees;
import java.awt.Color;

// API help : https://robocode.sourceforge.io/docs/robocode/robocode/Robot.html

/**
 * Practica3_6 - a robot by (Pareja 6)
 */
public class Practica3_6 extends AdvancedRobot {

    public void run() {
 

        setColors(Color.red, Color.blue, Color.green); // body,gun,radar

        // Robot main loop
        setAdjustGunForRobotTurn(true);
        setAdjustRadarForGunTurn(true);

        while (true) {
            setTurnRadarRight(360);

            avoidHitWall();
            setAhead(100);
            setTurnRight(45);
            execute();

            setBack(100);
            setTurnLeft(45);
            execute();
        }
    }

    /**
     * onScannedRobot: What to do when you see another robot
     */
    public void onScannedRobot(ScannedRobotEvent e) {
        double distance = e.getDistance();
        double firePower = Math.min(500 / distance, 3);

        // Gira el cañón hacia el enemigo
        double posicionEnemigo = getHeading() + e.getBearing();
        double movimientoArma = normalRelativeAngleDegrees(posicionEnemigo - getGunHeading());

        setTurnGunRight(movimientoArma);
        setTurnRadarRight(normalRelativeAngleDegrees(posicionEnemigo - getRadarHeading()));

        if (getGunHeat() == 0 && Math.abs(movimientoArma) <= 10) {
            if (distance < 100) {
                fire(firePower);
            } else {
			    setAhead(e.getDistance() - 50);
                fire(firePower);
            }
        }
        scan();
    }

    /**
     * onHitByBullet: What to do when you're hit by a bullet
     */
    public void onHitByBullet(HitByBulletEvent e) {
        setBack(50);
        setTurnRight(45);
        execute();
    }

    /**
     * onHitWall: What to do when you hit a wall
     */
    public void avoidHitWall() {
        if (getX() < 50 || getX() > getBattleFieldWidth() - 50 ||
            getY() < 50 || getY() > getBattleFieldHeight() - 50) {
            // Si estamos cerca de una pared, gira en un ángulo opuesto
            setTurnRight(180);
            setAhead(100);
            execute();
        }
    }
}
