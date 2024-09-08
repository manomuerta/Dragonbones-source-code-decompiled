package _877
{
   import _1045.Group;
   import _81._91;
   import _844._853;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _887 extends Group
   {
      public var _4341:_853;
      
      private var _6304:_91;
      
      private var _6038:Boolean = false;
      
      private var _2009:Matrix;
      
      private var _6478:Matrix;
      
      private var _4235:Point;
      
      public function _887()
      {
         this._4341 = new _853();
         this._2009 = new Matrix();
         this._6478 = new Matrix();
         this._4235 = new Point();
         super();
         width = 0;
         height = 0;
         visible = false;
         mouseEnabled = false;
         alpha = 0.9;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         addElement(this._4341);
      }
      
      public function get _1897() : _91
      {
         return this._6304;
      }
      
      public function set _1897(param1:_91) : void
      {
         if(this._6304 == param1)
         {
            return;
         }
         this._6304 = param1;
         this.visible = this._6304 != null;
         this._1751();
      }
      
      public function set _2026(param1:Matrix) : void
      {
         if(this._6478 != param1)
         {
            this._6478 = param1;
            this._1751();
         }
      }
      
      public function get _2026() : Matrix
      {
         return this._6478;
      }
      
      public function _1751() : void
      {
         this._6038 = true;
         _2466();
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(!visible)
         {
            return;
         }
         if(this._6038)
         {
            this._6038 = false;
            this._6037();
         }
      }
      
      protected function _6037() : void
      {
         this._2009.copyFrom(this._6478);
         this._4235.x = this._6304._2009.tx;
         this._4235.y = this._6304._2009.ty;
         this._4235 = this._2009.transformPoint(this._4235);
         this.x = this._4235.x;
         this.y = this._4235.y;
      }
      
      public function dispose() : void
      {
         this._1897 = null;
      }
   }
}

