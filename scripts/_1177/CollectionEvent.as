package _1177
{
   import flash.events.Event;
   
   public class CollectionEvent extends Event
   {
      public static const COLLECTION_CHANGE:String = "collectionChange";
      
      public var kind:String;
      
      public var items:Array;
      
      public var _5861:Array;
      
      public var location:int;
      
      public var oldLocation:int;
      
      public function CollectionEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null, param5:int = -1, param6:int = -1, param7:Array = null, param8:Array = null)
      {
         super(param1,param2,param3);
         this.kind = param4;
         this.location = param5;
         this.oldLocation = param6;
         this.items = !!param7 ? param7 : [];
         this._5861 = !!param8 ? param8 : [];
      }
      
      override public function toString() : String
      {
         return formatToString("CollectionEvent","kind","location","oldLocation","type","bubbles","cancelable","eventPhase");
      }
      
      override public function clone() : Event
      {
         return new CollectionEvent(type,bubbles,cancelable,this.kind,this.location,this.oldLocation,this.items,this._5861);
      }
   }
}

