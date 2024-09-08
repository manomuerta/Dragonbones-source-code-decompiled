package _658
{
   import _652._656;
   import _81._86;
   import _81._88;
   import _81._91;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _661 extends _656 implements _91
   {
      public static var _2026:Matrix;
      
      private var _2007:_86;
      
      private var _5764:_86;
      
      private var _2017:_86;
      
      private var _2006:Matrix;
      
      public function _661(param1:Number, param2:Number, param3:uint)
      {
         super(param1,param2,param3);
         this._2017 = new _86();
         this._2006 = new Matrix();
      }
      
      public static function _12507(param1:Vector.<_661>) : Vector.<_661>
      {
         var _loc2_:Vector.<_661> = new Vector.<_661>();
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_.push(param1[_loc3_].clone() as _661);
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function _12702(param1:Vector.<_661>, param2:Vector.<_661>) : Vector.<_661>
      {
         var _loc3_:Vector.<_661> = new Vector.<_661>();
         var _loc4_:int = 0;
         var _loc5_:int = int(param1.length);
         while(_loc4_ < _loc5_)
         {
            _loc3_.push(_12704(param1[_loc4_].id,param2));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function _12704(param1:int, param2:Vector.<_661>) : _661
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param2.length);
         while(_loc3_ < _loc4_)
         {
            if(param2[_loc3_].id == param1)
            {
               return param2[_loc3_];
            }
            _loc3_++;
         }
         return new _661(0,0,param1);
      }
      
      public function update() : void
      {
         this._2006.setTo(1,0,0,1,0,0);
         this._2006.tx += this.x;
         this._2006.ty += this.y;
         _88._2014(this._2006,this._2017,false,false);
      }
      
      public function get _1724() : _86
      {
         return this._2007;
      }
      
      public function get currentLocalTransform() : _86
      {
         return this._5764;
      }
      
      public function get globalTransform() : _86
      {
         return this._2017;
      }
      
      public function get _2009() : Matrix
      {
         return this._2006;
      }
      
      override public function clone() : Point
      {
         return new _661(this.x,this.y,this.id);
      }
      
      override public function copyFrom(param1:Point) : void
      {
         if(param1 is _661)
         {
            this.id = (param1 as _661).id;
         }
         super.copyFrom(param1);
      }
   }
}

