package _543
{
   import _28._29;
   import _541._540;
   import _710._713;
   import _73._72;
   import _783.MenuNotification;
   import _874._873;
   
   public class _546 extends _544
   {
      public function _546(param1:_873, param2:_540)
      {
         super(param1,param2);
      }
      
      override public function _3935(param1:_29) : void
      {
         var _loc2_:_72 = null;
         switch(param1.id)
         {
            case _713.SWAP_IMAGE:
               _1567(new MenuNotification(param1.userData,null,"scenePanel"));
               break;
            case _713.TWEEN_ALPHA:
               _loc2_ = _72.ALPHA;
               break;
            case _713.TWEEN_POSITION:
               _loc2_ = _72.POSITION;
               break;
            case _713.TWEEN_ROTATION:
               _loc2_ = _72.ROTATION;
               break;
            case _713.TWEEN_SCALE:
               _loc2_ = _72.SCALE;
               break;
            case _713.TWEEN_APPEAR_POSITION:
               _loc2_ = _72.APPEAR_POSITION;
               break;
            case _713.TWEEN_APPEAR_ALPHA:
               _loc2_ = _72.APPEAR_ALPHA;
               break;
            case _713.TWEEN_APPEAR_SCALE:
               _loc2_ = _72.APPEAR_SCALE;
               break;
            case _713.TWEEN_APPEAR_DROP:
               _loc2_ = _72.APPEAR_DROP;
               break;
            case _713.TWEEN_DISAPPEAR_POSITION:
               _loc2_ = _72.DISAPPEAR_POSITION;
               break;
            case _713.TWEEN_DISAPPEAR_ALPHA:
               _loc2_ = _72.DISAPPEAR_ALPHA;
               break;
            case _713.CHANGE_TWEEN_NULL:
               _loc2_ = _72.CHANGE_NULL;
               break;
            case _713.CHANGE_TWEEN_ALPHA:
               _loc2_ = _72.CHANGE_ALPHA;
               break;
            case _713.CHANGE_TWEEN_POSITION:
               _loc2_ = _72.CHANGE_POSITION;
               break;
            case _713.CHANGE_TWEEN_ROTATION:
               _loc2_ = _72.CHANGE_ROTATION;
               break;
            case _713.CHANGE_TWEEN_SCALE:
               _loc2_ = _72.CHANGE_SCALE;
               break;
            case _713.CHANGE_APPEAR_TWEEN_NULL:
               _loc2_ = _72.CHANGE_APPEAR_NULL;
               break;
            case _713.CHANGE_APPEAR_TWEEN_ALPHA:
               _loc2_ = _72.CHANGE_APPEAR_ALPHA;
               break;
            case _713.CHANGE_APPEAR_TWEEN_POSITION:
               _loc2_ = _72.CHANGE_APPEAR_POSITION;
               break;
            case _713.CHANGE_APPEAR_TWEEN_SCALE:
               _loc2_ = _72.CHANGE_APPEAR_SCALE;
               break;
            case _713.CHANGE_APPEAR_TWEEN_DROP:
               _loc2_ = _72.CHANGE_APPEAR_DROP;
               break;
            case _713.TWEEN_SHAKE:
               _loc2_ = _72.SHAKE;
               break;
            case _713.TWEEN_SWING:
               _loc2_ = _72.SWING;
               break;
            case _713.TWEEN_HEARTBEAT:
               _loc2_ = _72.HEARTBEAT;
               break;
            case _713.TWEEN_TWINKLE:
               _loc2_ = _72.TWINKLE;
               break;
            case _713.TWEEN_INVERT:
               _loc2_ = _72.INVERT;
               break;
            case _713.CHANGE_TWEEN_SHAKE:
               _loc2_ = _72.CHANGE_SHAKE;
               break;
            case _713.CHANGE_TWEEN_SWING:
               _loc2_ = _72.CHANGE_SWING;
               break;
            case _713.CHANGE_TWEEN_HEARTBEAT:
               _loc2_ = _72.CHANGE_HEARTBEAT;
               break;
            case _713.CHANGE_TWEEN_TWINKLE:
               _loc2_ = _72.CHANGE_TWINKLE;
               break;
            case _713.CHANGE_TWEEN_INVERT:
               _loc2_ = _72.CHANGE_INVERT;
               break;
            case _713.CHANGE_DISAPPEAR_TWEEN_NULL:
               _loc2_ = _72.CHANGE_DISAPPEAR_NULL;
               break;
            case _713.CHANGE_DISAPPEAR_TWEEN_POSITION:
               _loc2_ = _72.CHANGE_DISAPPEAR_POSITION;
               break;
            case _713.CHANGE_DISAPPEAR_TWEEN_ALPHA:
               _loc2_ = _72.CHANGE_DISAPPEAR_ALPHA;
         }
         if(_loc2_ != null)
         {
            _1567(new MenuNotification(param1.userData,null,_loc2_));
         }
      }
   }
}

