package _388
{
   import _93._92;
   
   public class _389 extends _92
   {
      private var type:String;
      
      private var isShow:Boolean;
      
      public function _389()
      {
         super();
      }
      
      override public function _1574() : void
      {
         this.execute();
         finish();
         _2217.addAction(this);
      }
      
      override public function execute() : void
      {
         super.execute();
         if(_2212 == null || _2212._3317 == null)
         {
            return;
         }
         this._3321();
         if(_1642 && Boolean(this.type))
         {
            if(this.isShow)
            {
               _2219 = false;
               _2215 = false;
               _2212._3317._3320(this.type);
            }
            else
            {
               _2219 = true;
               _2215 = true;
               _2212._3317._3318(this.type);
            }
         }
      }
      
      override public function revert() : void
      {
         super.revert();
         _2212._3317._3319();
      }
      
      private function _3321() : void
      {
         if(_1642 && Boolean(_1642.hasOwnProperty("type")) && Boolean(_1642.hasOwnProperty("isShow")))
         {
            this.type = _1642.type;
            this.isShow = _1642.isShow;
         }
      }
   }
}

