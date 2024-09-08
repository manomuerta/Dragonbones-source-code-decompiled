package _108
{
   public class _110 implements _109
   {
      private var _x:Number = 0;
      
      private var _y:Number = 0;
      
      private var _width:Number = 0;
      
      private var _height:Number = 0;
      
      private var _data:Object;
      
      private var _2309:Boolean = false;
      
      public function _110(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Object = null)
      {
         super();
         this._x = param1;
         this._y = param2;
         this._width = param3;
         this._height = param4;
         this.data = param5;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set y(param1:Number) : void
      {
         this._y = param1;
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function set width(param1:Number) : void
      {
         this._width = param1;
      }
      
      public function get width() : Number
      {
         return this._width;
      }
      
      public function set height(param1:Number) : void
      {
         this._height = param1;
      }
      
      public function get height() : Number
      {
         return this._height;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set _2306(param1:Boolean) : void
      {
         this._2309 = param1;
      }
      
      public function get _2306() : Boolean
      {
         return this._2309;
      }
      
      public function _2307() : _109
      {
         var _loc1_:_110 = new _110();
         _loc1_.x = this._x;
         _loc1_.y = this._y;
         _loc1_.width = this._width;
         _loc1_.height = this._height;
         _loc1_.data = this.data;
         _loc1_._2306 = this._2306;
         return _loc1_;
      }
      
      public function _2308() : _109
      {
         return new _110();
      }
   }
}

