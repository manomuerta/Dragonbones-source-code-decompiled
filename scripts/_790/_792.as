package _790
{
   import _1045.Group;
   import _644._646;
   import _724._14085;
   import _724._14087;
   import _724._723;
   import _724._725;
   import _724._726;
   import _724._732;
   import _81._88;
   import _859.LibraryImage;
   import _859._14095;
   import _859._861;
   import _859._865;
   import _859._868;
   import egret.core._1140;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _792 extends Group
   {
      private var _6045:LibraryImage;
      
      private var _6043:_861;
      
      private var _6041:_865;
      
      private var _6046:_868;
      
      private var _14743:_14095;
      
      private var _6047:_1140;
      
      private var _6042:_646;
      
      private var _m:Matrix;
      
      public function _792()
      {
         super();
         this._m = new Matrix();
      }
      
      public function set _6044(param1:_646) : void
      {
         this._6042 = param1;
         if(this._6042)
         {
            this._2104 = this._6042._2104;
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
            _88._2013(this._6042.transform,this._m);
            this._6047.transform.matrix = this._m;
            this._6047.alpha = 0.5;
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
      
      public function get _6044() : _646
      {
         return this._6042;
      }
      
      public function dispose() : void
      {
         this._2104 = null;
         this._6042 = null;
         this._6047 = null;
      }
   }
}

