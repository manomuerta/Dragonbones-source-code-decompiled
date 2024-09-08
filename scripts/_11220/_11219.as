package _11220
{
   import _652._654;
   import _652._656;
   import _658._661;
   import _73.BoundingBoxType;
   import _97._100;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _11219
   {
      public static const DEFAULT_NAME:String = "boundingBox";
      
      public var name:String;
      
      public var vertices:Vector.<_661>;
      
      public var color:uint;
      
      public var type:BoundingBoxType;
      
      public var width:Number;
      
      public var height:Number;
      
      public function _11219(param1:Boolean)
      {
         super();
         this.vertices = new Vector.<_661>();
         if(param1)
         {
            this.vertices.push(new _661(-50,-50,0));
            this.vertices.push(new _661(-50,50,0));
            this.vertices.push(new _661(50,50,0));
            this.vertices.push(new _661(50,-50,0));
         }
         this.type = BoundingBoxType.POLYGON;
         this.color = _100.BOUNDINGBOX_COLOR;
      }
      
      public function hitTest(param1:Point) : Boolean
      {
         return _654._11283(param1,Vector.<_656>(this.vertices));
      }
      
      public function get AABB() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         var _loc2_:Number = Number.MAX_VALUE;
         var _loc3_:Number = Number.MAX_VALUE;
         var _loc4_:Number = -Number.MAX_VALUE;
         var _loc5_:Number = -Number.MAX_VALUE;
         var _loc6_:int = 0;
         var _loc7_:int = int(this.vertices.length);
         while(_loc6_ < _loc7_)
         {
            if(this.vertices[_loc6_].x > _loc4_)
            {
               _loc4_ = this.vertices[_loc6_].x;
            }
            if(this.vertices[_loc6_].x < _loc2_)
            {
               _loc2_ = this.vertices[_loc6_].x;
            }
            if(this.vertices[_loc6_].y > _loc5_)
            {
               _loc5_ = this.vertices[_loc6_].y;
            }
            if(this.vertices[_loc6_].y < _loc3_)
            {
               _loc3_ = this.vertices[_loc6_].y;
            }
            _loc6_++;
         }
         _loc1_.x = _loc2_;
         _loc1_.y = _loc3_;
         _loc1_.width = _loc4_ - _loc2_;
         _loc1_.height = _loc5_ - _loc3_;
         return _loc1_;
      }
      
      public function clone() : _11219
      {
         var _loc1_:_11219 = new _11219(false);
         _loc1_.name = this.name;
         _loc1_.vertices = _661._12507(this.vertices);
         _loc1_.type = this.type;
         _loc1_.color = this.color;
         return _loc1_;
      }
   }
}

