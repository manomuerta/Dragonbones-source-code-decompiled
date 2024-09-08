package _790
{
   import _1045.Group;
   import _1045._1070;
   import _51._79;
   import _724._14085;
   import _724._14087;
   import _724._723;
   import _724._725;
   import _724._726;
   import _724._732;
   import _859.LibraryImage;
   import _859._14095;
   import _859._861;
   import _859._865;
   import _859._868;
   import egret.core._1140;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _794 extends Group implements _1070
   {
      private var _6045:LibraryImage;
      
      private var _6043:_861;
      
      private var _6041:_865;
      
      private var _6046:_868;
      
      private var _14743:_14095;
      
      private var _6047:_1140;
      
      private var _4213:_79;
      
      private var _m:Matrix;
      
      private var _selected:Boolean;
      
      private var _2540:int;
      
      private var _2541:String;
      
      private var _data:Object;
      
      private var _5389:Boolean;
      
      public function _794()
      {
         super();
         this._m = new Matrix();
      }
      
      public function set _1837(param1:_79) : void
      {
         this._4213 = param1;
         if(this._4213)
         {
            if(this._4213._2049)
            {
               this._2104 = this._4213._2049._2104;
            }
         }
         else
         {
            this._2104 = null;
         }
         this.refresh();
      }
      
      public function refresh() : void
      {
         if(this._6047)
         {
            this.transform.matrix = this._4213._2009;
            this.transform.colorTransform = this._4213._1926;
         }
      }
      
      public function _6048(param1:Point) : Boolean
      {
         if(this._6047 == null)
         {
            return false;
         }
         var _loc2_:Point = this._6047.globalToLocal(param1);
         var _loc3_:Rectangle = this._6047["AABB"];
         if(_loc3_)
         {
            return _loc3_.containsPoint(_loc2_);
         }
         return false;
      }
      
      private function set _2104(param1:_725) : void
      {
         if(this._6047 != null)
         {
            if(this._6045)
            {
               this._6045._2104 = null;
            }
            if(this._6046)
            {
               this._6046.mesh = null;
            }
            this._6047 = null;
         }
         _2426();
         if(param1 is _732)
         {
            this._6045 = new LibraryImage();
            this._6045._2104 = param1;
            this._6045._6040();
            this._6047 = this._6045;
         }
         else if(param1 is _726 || param1 is _14087)
         {
            this._6041 = new _865();
            this._6041._2104 = param1;
            this._6047 = this._6041;
         }
         else if(param1 is _723)
         {
            this._6043 = new _861();
            this._6043._2104 = param1;
            this._6043._6040();
            this._6047 = this._6043;
         }
         else if(param1 is _14085)
         {
            this._14743 = new _14095();
            this._14743._2104 = param1;
            this._14743._6040();
            this._6047 = this._14743;
         }
         if(this._6047)
         {
            addElement(this._6047);
         }
      }
      
      public function get _1837() : _79
      {
         return this._4213;
      }
      
      public function dispose() : void
      {
         this._2104 = null;
         this._4213 = null;
         this._6047 = null;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
      }
      
      public function get itemIndex() : int
      {
         return this._2540;
      }
      
      public function set itemIndex(param1:int) : void
      {
         this._2540 = param1;
      }
      
      public function get label() : String
      {
         return this._2541;
      }
      
      public function set label(param1:String) : void
      {
         this._2541 = param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         if(this._data is _79)
         {
            this._1837 = this._data as _79;
         }
      }
   }
}

