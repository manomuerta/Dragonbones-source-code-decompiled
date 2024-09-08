package _799
{
   import _1045._1082;
   import _1439._1269;
   
   public class _802 extends _1269
   {
      protected var _6087:uint = 1843496;
      
      public var rect:_1082;
      
      public function _802()
      {
         this.rect = new _1082();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.rect._2564 = 1;
         this.rect._2529 = 1;
         this.rect.left = 0;
         this.rect.right = 0;
         this.rect.top = 0;
         this.rect.bottom = 0;
         addElement(this.rect);
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._6086();
      }
      
      protected function _6086() : void
      {
         this.rect._2563 = this._6087;
         this.rect.fillColor = this._6087;
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "over")
         {
         }
      }
   }
}

