package _439
{
   import _1404._1407;
   import _40.BoneFrameVO;
   import _40._45;
   import _40._47;
   import _573.TimelinePanelController;
   import _676._690;
   import _703._705;
   import _81._86;
   import _93._92;
   
   public class _443 extends _92
   {
      public function _443()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:_445 = _2223 as _445;
         switch(_loc1_._3136)
         {
            case _445.TWEEN_ENABLED:
               _loc1_._1946.tweenType = !!_loc1_.value ? 1 : 0;
               break;
            case _445.ALL:
               _loc1_._1946.copyFrom(_loc1_.value as _45);
               break;
            case _445.ALL_WITHOUT_PLACEHOLDER:
               if(_loc1_._1946 is _47)
               {
                  (_loc1_._1946 as _47)._1918(_loc1_.value);
               }
               else
               {
                  _loc1_._1946.copyFrom(_loc1_.value as _45);
               }
               break;
            case _445.TRANSFORM:
               BoneFrameVO(_loc1_._1946).transform.copyFrom(_loc1_.value as _86);
               BoneFrameVO(_loc1_._1946).transform._1738();
         }
         var _loc2_:_690 = _705._3137[_loc1_._1946];
         _loc2_.dataChange();
         (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._3133();
         (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._3002();
      }
      
      override public function revert() : void
      {
         var _loc1_:_445 = _2208 as _445;
         switch(_loc1_._3136)
         {
            case _445.TWEEN_ENABLED:
               _loc1_._1946.tweenType = !!_loc1_.value ? 1 : 0;
               break;
            case _445.ALL:
               _loc1_._1946.copyFrom(_loc1_.value as _45);
               break;
            case _445.ALL_WITHOUT_PLACEHOLDER:
               if(_loc1_._1946 is _47)
               {
                  (_loc1_._1946 as _47)._1918(_loc1_.value);
               }
               else
               {
                  _loc1_._1946.copyFrom(_loc1_.value as _45);
               }
               break;
            case _445.TRANSFORM:
               BoneFrameVO(_loc1_._1946).transform.copyFrom(_loc1_.value as _86);
         }
         var _loc2_:_690 = _705._3137[_loc1_._1946];
         _loc2_.dataChange();
         (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._3133();
         (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._3002();
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         var _loc2_:_445 = new _445();
         _loc2_._1946 = _2223._1946;
         _loc2_._3136 = _2223._3136;
         switch(_2223._3136)
         {
            case _445.TWEEN_ENABLED:
               _loc2_.value = _2223._1946.tweenEnabled;
               break;
            case _445.ALL:
               _loc2_.value = _2223._1946.clone();
               break;
            case _445.TRANSFORM:
               _loc2_.value = BoneFrameVO(_2223._1946).transform.clone();
         }
         _2208 = _loc2_;
      }
      
      override protected function _2211() : *
      {
         return _2208;
      }
   }
}

