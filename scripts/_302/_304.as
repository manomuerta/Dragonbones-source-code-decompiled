package _302
{
   import _1404._1407;
   import _18.IAction;
   import _51._70;
   import _51._79;
   import _586._594;
   import _658.Mesh;
   import _658._661;
   import _81._86;
   import _81._88;
   import _880._879;
   import _93._92;
   import flash.geom.Matrix;
   
   public class _304 extends _92
   {
      public function _304()
      {
         super();
         _2215 = true;
         _2219 = true;
         _2224 = true;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_304 = param1 as _304;
         if(_loc2_)
         {
            _2223.deltaX += _loc2_.deltaX;
            _2223.deltaY += _loc2_.deltaY;
            return true;
         }
         return false;
      }
      
      private function _14433() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:_86 = null;
         var _loc4_:Matrix = null;
         var _loc5_:Matrix = null;
         if(this.mesh.globalTransform.x != 0 || this.mesh.globalTransform.y != 0)
         {
            _loc1_ = this.mesh.globalTransform.x;
            _loc2_ = this.mesh.globalTransform.y;
            this.mesh._5721(-_loc1_,-_loc2_);
            _loc3_ = new _86();
            _loc3_.rotation = -this._1837.currentLocalTransform.rotation;
            _loc4_ = new Matrix();
            _88._2013(_loc3_,_loc4_);
            _loc5_ = new Matrix();
            _88._2013(this._1837.currentLocalTransform,_loc5_);
            _loc5_.concat(_loc4_);
            _loc5_.tx += _loc1_;
            _loc5_.ty += _loc2_;
            _loc4_.invert();
            _loc5_.concat(_loc4_);
            _88._2014(_loc5_,_loc3_,true,true);
            this._1837.currentLocalTransform.copyFrom(_loc3_);
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.vertices.length);
         while(_loc1_ < _loc2_)
         {
            this.vertices[_loc1_].x += this.deltaX;
            this.vertices[_loc1_].y += this.deltaY;
            _loc1_++;
         }
         this.mesh._3144();
         this._14433();
         if(this.mesh.AABB.width >= _879.MAX_SIZE)
         {
            _loc1_ = 0;
            _loc2_ = int(this.vertices.length);
            while(_loc1_ < _loc2_)
            {
               this.vertices[_loc1_].x -= this.deltaX;
               _loc1_++;
            }
            _2223.deltaX = 0;
         }
         if(this.mesh.AABB.height >= _879.MAX_SIZE)
         {
            _loc1_ = 0;
            _loc2_ = int(this.vertices.length);
            while(_loc1_ < _loc2_)
            {
               this.vertices[_loc1_].y -= this.deltaY;
               _loc1_++;
            }
            _2223.deltaY = 0;
         }
         this.mesh._3143();
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.vertices.length);
         while(_loc1_ < _loc2_)
         {
            this.vertices[_loc1_].x -= this.deltaX;
            this.vertices[_loc1_].y -= this.deltaY;
            _loc1_++;
         }
         this.mesh._3144();
         this._14433();
         this.mesh._3143();
         this._2894();
      }
      
      private function _2894() : void
      {
         this.vertex.update();
         this.mesh.invalid = true;
         this.mesh.update();
         if(this._1837)
         {
            _2212._2907(this._1837);
         }
         this._3008._3139();
      }
      
      private function get _1838() : _70
      {
         return _2223._1838 as _70;
      }
      
      private function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      private function get mesh() : Mesh
      {
         return this._1838.mesh;
      }
      
      private function get vertex() : _661
      {
         return _2223.vertex as _661;
      }
      
      private function get vertices() : Vector.<_661>
      {
         return _2223.vertices as Vector.<_661>;
      }
      
      protected function get deltaX() : Number
      {
         return _2223.deltaX as Number;
      }
      
      protected function get deltaY() : Number
      {
         return _2223.deltaY as Number;
      }
      
      private function get _3008() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
   }
}

