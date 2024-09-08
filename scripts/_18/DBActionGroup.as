package _18
{
   public class DBActionGroup extends _20 implements IAction
   {
      public function DBActionGroup()
      {
         super();
      }
      
      public static function _1630(param1:Object) : DBActionGroup
      {
         var _loc2_:DBActionGroup = null;
         _loc2_ = new DBActionGroup();
         _loc2_._1636 = _22._1625(param1.actions);
         _loc2_.currentPosition = param1.currentPosition;
         _loc2_._1643 = false;
         return _loc2_;
      }
      
      public static function _1629(param1:DBActionGroup) : Object
      {
         return {
            "currentPosition":param1.currentPosition,
            "actions":_22._1626(param1._1636)
         };
      }
      
      override protected function _1632() : void
      {
         _1640 = _1643 && _1628 > 0;
      }
      
      override protected function _1633() : void
      {
         _1641 = _1643 && _1627 > 0;
      }
      
      public function get _1799() : String
      {
         return "DBActionGroup";
      }
      
      public function get _11209() : Boolean
      {
         return false;
      }
      
      public function finish() : void
      {
      }
      
      public function get _1637() : Boolean
      {
         return true;
      }
      
      public function get _1631() : Boolean
      {
         return true;
      }
      
      public function get _1642() : *
      {
         return null;
      }
      
      public function set _1642(param1:*) : void
      {
      }
      
      public function get _1634() : *
      {
         return null;
      }
      
      public function set _1634(param1:*) : void
      {
      }
      
      public function get _1639() : Boolean
      {
         return false;
      }
      
      public function set _1639(param1:Boolean) : void
      {
      }
      
      public function merge(param1:IAction) : Boolean
      {
         return false;
      }
      
      public function clearCache() : void
      {
      }
   }
}

