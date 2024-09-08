package _1177
{
   import _1045._1070;
   import flash.events.Event;
   
   public class RendererExistenceEvent extends Event
   {
      public static const RENDERER_ADD:String = "rendererAdd";
      
      public static const RENDERER_REMOVE:String = "rendererRemove";
      
      public var data:Object;
      
      public var index:int;
      
      public var _2487:_1070;
      
      public function RendererExistenceEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:_1070 = null, param5:int = -1, param6:Object = null)
      {
         super(param1,param2,param3);
         this._2487 = param4;
         this.index = param5;
         this.data = param6;
      }
      
      override public function clone() : Event
      {
         return new RendererExistenceEvent(type,bubbles,cancelable,this._2487,this.index,this.data);
      }
   }
}

