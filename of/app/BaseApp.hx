package of.app;

import cpp.Lib;
import of.utils.Utils;
import of.events.Events;
import hsl.haxe.Signaler;

class BaseApp 
{
		public function new():Void {
            __handle = _ofBaseApp_new();
			events = new Events(this);
			_ofBaseApp_setHandle(__handle, this);
        }
		
		public var events(default,null):Events;

		public function setup():Void {}
		public function update():Void {}
		public function draw():Void {}
		public function exit():Void {}


		public function windowResized(w:Int, h:Int):Void {}
		public function keyPressed( key:Int ):Void {}
		public function keyReleased( key:Int ):Void {}
		public function mouseMoved( x:Int, y:Int ):Void {}
		public function mouseDragged( x:Int, y:Int, button:Int ):Void {}
		public function mousePressed( x:Int, y:Int, button:Int ):Void {}
		public function mouseReleased( ?x:Int, ?y:Int, ?button:Int ):Void {}

		public function audioReceived( input:Array<Float>, bufferSize:Int, nChannels:Int ):Void{}
		public function audioRequested( output:Array<Float>, bufferSize:Int, nChannels:Int ):Void{}

		// for processing heads
		public var mouseX(__getMouseX, null):Int;
		public var mouseY(__getMouseY, null):Int;
		
		public var __handle(default, null):Dynamic;

		function __getMouseX():Int {
			return _ofBaseApp_getMouseX(__handle);
		}
		function __getMouseY():Int {
			return _ofBaseApp_getMouseY(__handle);
		}
		
		function __mouseDragged( args: { x:Int, y:Int, button:Int } ):Void {
			mouseDragged(args.x, args.y, args.button);
		}
		
		function __mousePressed( args: { x:Int, y:Int, button:Int } ):Void {
			mousePressed(args.x, args.y, args.button);
		}
		
		function __mouseReleased( args: { x:Int, y:Int, button:Int } ):Void {
			mouseReleased(args.x, args.y, args.button);
		}
		
		inline function __dispatch(signaler:Signaler<Dynamic>, args:Dynamic):Void {
			signaler.dispatch(args);
		}
		
		static var _ofBaseApp_new = Lib.load("hxOpenFrameworks", "_ofBaseApp_new", 0);
		static var _ofBaseApp_getMouseX = Lib.load("hxOpenFrameworks", "_ofBaseApp_getMouseX", 1);
		static var _ofBaseApp_getMouseY = Lib.load("hxOpenFrameworks", "_ofBaseApp_getMouseY", 1);
		static var _ofBaseApp_setHandle = Lib.load("hxOpenFrameworks", "_ofBaseApp_setHandle", 2);
}
