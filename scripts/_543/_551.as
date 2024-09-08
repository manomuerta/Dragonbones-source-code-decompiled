package _543
{
   import _11106._11108;
   import _11111._11110;
   import _1404._1407;
   import _28._29;
   import _541._540;
   import _555._571;
   import _579._580;
   import _710._713;
   import _783.CommandNotification;
   import _874._873;
   
   public class _551 extends _544
   {
      public function _551(param1:_873, param2:_540)
      {
         super(param1,param2);
      }
      
      override public function _3935(param1:_29) : void
      {
         _11110.instance._11593(param1.userData,_11108.StageContextMenu);
         switch(param1.id)
         {
            case _713.SELECT_ALL:
            case _713.IMPORT_IMAGES:
            case _713.IMPORT_SEQUENCE_IMAGES:
               this._1567(new CommandNotification(param1.userData));
               break;
            case _713.SHOW_ALL:
               this._2880.showAll();
               break;
            case _713.CLEAR_RULER_LINES:
               this._3176.clearRulerLines();
         }
      }
      
      private function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      private function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
   }
}

