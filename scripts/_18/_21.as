package _18
{
   public class _21 extends _20
   {
      private var _1656:Boolean = false;
      
      public function _21()
      {
         super();
      }
      
      public static function _1630(param1:Object) : _21
      {
         var _loc2_:_21 = new _21();
         _loc2_._1636 = _22._1625(param1.actions);
         _loc2_.currentPosition = param1.currentPosition;
         _loc2_._1649 = param1.currentPosition;
         return _loc2_;
      }
      
      public static function _1629(param1:_21) : Object
      {
         return {
            "currentPosition":param1.currentPosition,
            "actions":_22._1626(param1._1636)
         };
      }
      
      public function _1657() : void
      {
         _1649 = _1628;
      }
      
      override protected function _1632() : void
      {
         var _loc1_:Boolean = _1640;
         super._1632();
         if(_loc1_ != _1640)
         {
            dispatchEvent(new DBHistoryEvent(DBHistoryEvent.UNDOABLE_CHANGED));
         }
      }
      
      override protected function _1633() : void
      {
         var _loc1_:Boolean = _1641;
         super._1633();
         if(_loc1_ != _1641)
         {
            dispatchEvent(new DBHistoryEvent(DBHistoryEvent.REDOABLE_CHANGED));
         }
      }
      
      override protected function _1647() : void
      {
         var _loc1_:* = _1648 != _1628;
         if(this._1656 != _loc1_)
         {
            this._1656 = _loc1_;
            dispatchEvent(new DBHistoryEvent(DBHistoryEvent.SAVEABLE_CHANGED));
         }
      }
      
      public function _10652() : void
      {
         dispatchEvent(new DBHistoryEvent(DBHistoryEvent.SAVEABLE_CHANGED));
      }
      
      public function get _1658() : Boolean
      {
         return this._1656;
      }
      
      override public function get _1643() : Boolean
      {
         return true;
      }
   }
}

