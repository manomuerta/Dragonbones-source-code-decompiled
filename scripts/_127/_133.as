package _127
{
   import _1177.CloseEvent;
   import _1374.Alert;
   import _636.DBModelEvent;
   import egret.core._1135;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.events.Event;
   
   public class _133 extends Alert
   {
      public var _2500:_128;
      
      private var _2492:Function;
      
      public function _133()
      {
         super();
         type = "utility";
         if(SystemInfo.isMacOS)
         {
            this.skinName = _134;
         }
         else
         {
            this.skinName = _135;
         }
      }
      
      public static function show(param1:String = "", param2:String = "", param3:_1135 = null, param4:Function = null, param5:String = "Alert.Confirm", param6:String = "", param7:String = "", param8:Boolean = true, param9:Function = null, param10:Boolean = true, param11:Number = NaN) : _133
      {
         var _loc12_:_133 = null;
         if(!param8)
         {
            param4(new CloseEvent(CloseEvent.CLOSE,false,false,Alert.FIRST_BUTTON));
            return null;
         }
         (_loc12_ = new _133())._2505 = param1;
         _loc12_.title = param2;
         param5 = tr(param5);
         _loc12_._2499 = param5;
         _loc12_._2497 = param6;
         _loc12_._2498 = param7;
         _loc12_._2503 = param4;
         _loc12_._2502 = param9;
         _loc12_._2507 = param10;
         _loc12_._2504 = param3;
         if(!isNaN(param11))
         {
            _loc12_.width = param11;
         }
         _loc12_.open();
         return _loc12_;
      }
      
      override protected function _2501() : void
      {
         this._2500.addEventListener(Event.CHANGE,this._2493);
      }
      
      private function _2493(param1:Event) : void
      {
         var _loc2_:DBModelEvent = new DBModelEvent(DBModelEvent.PREFERENCE_DELETE_CHANGED,this._2500.selected);
         this._2502(_loc2_);
      }
      
      public function get _2502() : Function
      {
         return this._2492;
      }
      
      public function set _2502(param1:Function) : void
      {
         this._2492 = param1;
      }
   }
}

