package _543
{
   import _1404._1407;
   import _28._29;
   import _541._540;
   import _555.AnimationPanelController;
   import _710._713;
   import _783.MenuNotification;
   import _874._873;
   import _97._115;
   
   public class _542 extends _544
   {
      public function _542(param1:_873, param2:_540)
      {
         super(param1,param2);
      }
      
      override public function _3935(param1:_29) : void
      {
         switch(param1.id)
         {
            case _713.RENAME:
               _1567(new MenuNotification(param1.userData,null,"animationPanel"));
               break;
            case _713.ADD_ANIMATIOM:
            case _713.DELETE_ANIMATION:
            case _713.CLONE_ANIMATION:
            default:
               this._1567(new MenuNotification(param1.userData,param1.id.toString(),Boolean(targets) && targets.length > 0 ? targets[0] : null));
         }
      }
      
      override protected function _3941(param1:Array) : void
      {
      }
      
      override protected function _3939() : void
      {
         var _loc1_:_29 = _115._2364(_713.RENAME) as _29;
         var _loc2_:_29 = _115._2364(_713.CLONE_ANIMATION) as _29;
         var _loc3_:_29 = _115._2364(_713.ADD_ANIMATIOM) as _29;
         var _loc4_:_29 = _115._2364(_713.DELETE_ANIMATION) as _29;
         var _loc5_:Array = this._2858._3940();
         _loc1_.enabled = _loc5_[0];
         _loc2_.enabled = _loc5_[1];
         _loc3_.enabled = _loc5_[2];
         _loc4_.enabled = _loc5_[3];
      }
      
      private function get _2858() : AnimationPanelController
      {
         return _1407.getInstance(AnimationPanelController) as AnimationPanelController;
      }
   }
}

