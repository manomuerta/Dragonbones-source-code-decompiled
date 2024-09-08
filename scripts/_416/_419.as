package _416
{
   public class _419 extends _420
   {
      public function _419()
      {
         super();
      }
      
      override public function execute() : void
      {
         super.execute();
         if(!autoKey)
         {
            this._3405(this.newAnimation);
         }
         else
         {
            _1946.gotoAndPlay = this.newAnimation;
            if(_3005)
            {
               addFrame();
            }
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         if(!autoKey)
         {
            this._3405(this._2945);
         }
         else if(_3005)
         {
            delFrame();
         }
         else
         {
            _1946.gotoAndPlay = this._2945;
         }
         _2209._3151();
         this._2894();
      }
      
      protected function _2894() : void
      {
         _2212._3006(_1837);
         if(autoKey)
         {
            _2852.refresh();
         }
         _2852._3002();
         _2853.refresh();
      }
      
      protected function _3405(param1:String) : void
      {
         _1837._2161 = param1;
         _2209._3404(_1837);
      }
      
      protected function get newAnimation() : String
      {
         return _2223.newAnimation;
      }
      
      protected function get _2945() : String
      {
         return _2223._2945;
      }
   }
}

