package _279
{
   import _51._79;
   import _54._57;
   import _644._645;
   import _644._646;
   
   public class _284 extends _278
   {
      public function _284()
      {
         super();
         _2219 = true;
         _2215 = true;
         _3079 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc5_:_646 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         super._1572(param1);
         var _loc2_:_646 = _3058._3098(_2071);
         _2223._3081 = _loc2_.index;
         _2223._3087 = _loc2_;
         _2223._3078 = _loc2_.tweens.indexOf(_2071);
         var _loc3_:_645 = _loc2_.parent;
         _2223._3070 = _loc3_;
         var _loc4_:_79 = _2071._1837;
         _loc6_ = 0;
         _loc7_ = int(this._3102.tweens.length);
         while(_loc6_ < _loc7_)
         {
            if(this._3102.tweens[_loc6_]._1837 == _loc4_)
            {
               _loc5_ = _loc3_._3098(this._3102);
               break;
            }
            _loc6_++;
         }
         if(_loc5_ == null)
         {
            _loc5_ = new _646(_loc3_);
         }
         _loc5_.track = this._3102;
         _2223._3086 = _loc5_;
         _2223._3080 = 0;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3102._2076(_2071,this._3099);
         deleteTween();
         if(!_3087._3071 && !_3087._10286)
         {
            _3087._2075(_2071);
            if(_3087.tweens.length == 0)
            {
               _3070._2073(_3087);
            }
            _3086.addTween(_2071);
            if(_3086.tweens.length == 1)
            {
               _3070._2074(_3086,_3080);
            }
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
         _3082();
         this._3102._2075(_2071);
         if(_3087.tweens.length == 0 || !_3087._3071 && !_3087._10286)
         {
            _3087._2076(_2071,_3078);
            if(_3087.tweens.length == 1)
            {
               _3070._2074(_3087,_3081);
            }
            _3086._2075(_2071);
            if(_3086.tweens.length == 0)
            {
               _3070._2073(_3086);
            }
            _target = _3087;
         }
         else
         {
            _3087.track = _3090;
            _target = _2071._1837;
         }
         _2894();
      }
      
      public function get _3099() : int
      {
         return _2223._3099;
      }
      
      public function get _3102() : _57
      {
         return _2223._3102;
      }
   }
}

