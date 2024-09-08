package _279
{
   import _54._56;
   import _54._57;
   import _644._645;
   import _644._646;
   
   public class _283 extends _278
   {
      public function _283()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         var _loc2_:_646 = _3058._3098(_2071);
         _2223._3081 = _loc2_.index;
         _2223._3087 = _loc2_;
         _2223._3078 = _loc2_.tweens.indexOf(_2071);
         var _loc3_:_645 = _loc2_.parent;
         var _loc4_:_646;
         (_loc4_ = new _646(_loc3_)).track = this._3102;
         _loc4_.tweens.push(_2071);
         _2223._3086 = _loc4_;
         _2223._3080 = 0;
         _2223._3070 = _loc3_;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3102.addTween(_2071);
         this._3103._2074(this._3102,this._3100);
         deleteTween();
         if(!_3087._3071 && !_3087._10286)
         {
            _3087._2075(_2071);
            if(_3087.tweens.length == 0)
            {
               _3070._2073(_3087);
            }
            _3070._2074(_3086,_3080);
            _target = _3086;
         }
         else
         {
            _3087.track = this._3102;
            _target = _2071._1837;
         }
         _2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._3103._2073(this._3102);
         this._3102._2075(_2071);
         _3082();
         if(_3087.tweens.length == 0 || !_3087._3071 && !_3087._10286)
         {
            _3087._2076(_2071,_3078);
            if(_3087.tweens.length == 1)
            {
               _3070._2074(_3087,_3081);
            }
            _3070._2073(_3086);
            _target = _3087;
         }
         else
         {
            _3087.track = _3090;
            _target = _2071._1837;
         }
         _2894();
      }
      
      private function get _3102() : _57
      {
         return _2223._3102 as _57;
      }
      
      private function get _3100() : int
      {
         return int(_2223._3100);
      }
      
      private function get _3103() : _56
      {
         return _2223._3103 as _56;
      }
   }
}

