package _14229
{
   import flash.events.Event;
   
   public class StyleDeclarationEvent extends Event
   {
      public static const PROPERTY_CHANGE:String = "propertyChange";
      
      private var _15450:String;
      
      private var _15452:String;
      
      private var _15451:String;
      
      public function StyleDeclarationEvent(param1:String, param2:String, param3:String, param4:String)
      {
         super(param1);
         this._15450 = param2;
         this._15452 = param3;
         this._15451 = param4;
      }
      
      public function get propertyName() : String
      {
         return this._15450;
      }
      
      public function get oldValue() : String
      {
         return this._15452;
      }
      
      public function get newValue() : String
      {
         return this._15451;
      }
   }
}

