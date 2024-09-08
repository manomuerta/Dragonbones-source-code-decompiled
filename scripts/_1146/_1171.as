package _1146
{
   import flash.events.IEventDispatcher;
   
   public interface _1171 extends IEventDispatcher
   {
      function get duration() : Number;
      
      function set duration(param1:Number) : void;
      
      function get isPlaying() : Boolean;
      
      function get _8834() : Number;
      
      function set _8834(param1:Number) : void;
      
      function get target() : Object;
      
      function set target(param1:Object) : void;
      
      function get targets() : Array;
      
      function set targets(param1:Array) : void;
      
      function get _8324() : Number;
      
      function set _8324(param1:Number) : void;
      
      function _8822(param1:Array = null) : Array;
      
      function _8777(param1:Object = null) : _1172;
      
      function _8835(param1:_1172) : void;
      
      function play(param1:Array = null, param2:Boolean = false) : Array;
      
      function pause() : void;
      
      function stop() : void;
      
      function resume() : void;
      
      function reverse() : void;
      
      function end(param1:_1172 = null) : void;
   }
}

