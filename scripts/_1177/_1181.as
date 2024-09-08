package _1177
{
   import flash.events.Event;
   
   public class _1181 extends Event
   {
      public static const PROPERTY_CHANGE:String = "propertyChange";
      
      public var kind:String;
      
      public var newValue:Object;
      
      public var oldValue:Object;
      
      public var property:Object;
      
      public var source:Object;
      
      public function _1181(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null, param5:Object = null, param6:Object = null, param7:Object = null, param8:Object = null)
      {
         super(param1,param2,param3);
         this.kind = param4;
         this.property = param5;
         this.oldValue = param6;
         this.newValue = param7;
         this.source = param8;
      }
      
      public static function _7812(param1:Object, param2:Object, param3:Object, param4:Object) : _1181
      {
         var _loc5_:_1181;
         (_loc5_ = new _1181(PROPERTY_CHANGE)).kind = _1182.UPDATE;
         _loc5_.oldValue = param3;
         _loc5_.newValue = param4;
         _loc5_.source = param1;
         _loc5_.property = param2;
         return _loc5_;
      }
      
      override public function clone() : Event
      {
         return new _1181(type,bubbles,cancelable,this.kind,this.property,this.oldValue,this.newValue,this.source);
      }
   }
}

