package funkin.game;

import flixel.math.FlxMatrix;
import flixel.math.FlxPoint;

class HudCamera extends FlxCamera {
	public var downscroll:Bool = false;
	//public override function update(elapsed:Float) {
	//	super.update(elapsed);
	//	// flipY = downscroll;
	//}


	// public override function drawPixels(?frame:FlxFrame, ?pixels:BitmapData, matrix:FlxMatrix, ?transform:ColorTransform, ?blend:BlendMode, ?smoothing:Bool = false,
	// 	?shader:FlxShader):Void
	// {
	// 	if (downscroll) {
	// 		matrix.scale(1, -1);
	// 		matrix.translate(0, height);
	// 	}
	// 	super.drawPixels(frame, pixels, matrix, transform, blend, smoothing, shader);
	// }


public var middlescroll:Bool = false;
public override function alterScreenPosition(spr:FlxObject, pos:FlxPoint) {
    if (downscroll) {
        pos.set(pos.x, height - pos.y - spr.height); // Downscroll logic
    }

    if (middlescroll) { // Middle scroll logic
        if (spr.ID >= 0 && spr.ID < 4) { // Opponent notes
            pos.set((width / 2) - 250 + (spr.ID * 100), pos.y);
        } else if (spr.ID >= 4 && spr.ID < 8) { // Player notes
            pos.set((width / 2) + 50 + ((spr.ID - 4) * 100), pos.y);
        }
    }

    return pos;
}
}