package _790
{
   import _1045.Group;
   import _51._79;
   import _644._646;
   import _81._88;
   import _81._91;
   import _825._824;
   import flash.geom.Matrix;
   
   public class _791 extends Group
   {
      private var _color:uint;
      
      private var _6039:_824;
      
      private var _target:_91;
      
      private var _m:Matrix;
      
      private var _6038:Boolean;
      
      public function _791(param1:uint)
      {
         this._6039 = new _824();
         super();
         mouseEnabled = false;
         mouseChildren = false;
         alpha = 0.9;
         this._color = param1;
         this._m = new Matrix();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6039.color = this._color;
         this.addElement(this._6039);
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._6038)
         {
            this._6038 = false;
            this._6037();
         }
      }
      
      public function _6037() : void
      {
         if(this._target)
         {
            _88._2013(this._target.globalTransform,this._m);
            this.transform.matrix = this._m;
         }
      }
      
      public function _1988() : void
      {
         if(this._target)
         {
            this._6038 = true;
            _2466();
            if(this._target is _646)
            {
               this._6039._2104 = (this._target as _646)._2104;
            }
            else if(this._target is _79)
            {
               this._6039._2104 = (this._target as _79)._2049._2104;
            }
         }
         else
         {
            this._6039._2104 = null;
         }
      }
      
      public function set target(param1:_91) : void
      {
         if(this._target == param1)
         {
            return;
         }
         this._target = param1;
         this._1988();
      }
   }
}

