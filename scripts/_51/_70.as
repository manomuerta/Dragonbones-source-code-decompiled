package _51
{
   import _11220._11219;
   import _13505._13507;
   import _1404._1407;
   import _35.HashObject;
   import _521._528;
   import _658.Mesh;
   import _658._661;
   import _724._11251;
   import _724._14087;
   import _724._723;
   import _724._725;
   import _724._726;
   import _724._732;
   import _724._735;
   import _724._737;
   import _73._74;
   import _81._86;
   import _81._90;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class _70 extends HashObject implements _90
   {
      public var _1733:_69;
      
      public var _1760:_79;
      
      public var _1985:_78;
      
      public var type:_74;
      
      public var localTransform:_86;
      
      public var _1813:Number;
      
      public var _1806:Number;
      
      public var filterType:_74;
      
      protected var _2113:String;
      
      protected var _2116:String;
      
      protected var _2117:String;
      
      protected var _2101:_725;
      
      public var path:String;
      
      private var _14297:String;
      
      private var _2109:*;
      
      private var _2123:Mesh;
      
      private var _2098:_13507;
      
      private var _2114:Vector.<Number>;
      
      private var _2093:Vector.<Number>;
      
      private var _2105:Vector.<Number>;
      
      public var _11278:_11219;
      
      public var _14296:Rectangle;
      
      public function _70(param1:int = 0, param2:Object = null)
      {
         this.localTransform = new _86();
         super(param1,param2);
      }
      
      public static function _2089(param1:Mesh, param2:_725, param3:int = 0, param4:Object = null) : _70
      {
         var _loc5_:_70 = _2090(param2,param3,param4);
         _loc5_._2110(param1);
         return _loc5_;
      }
      
      public static function _1719(param1:Mesh, param2:String, param3:int = 0, param4:Object = null) : _70
      {
         var _loc5_:_70 = _1734(param2,param3,param4);
         _loc5_._2110(param1);
         return _loc5_;
      }
      
      public static function _2090(param1:_725, param2:int = 0, param3:Object = null) : _70
      {
         var _loc5_:String = null;
         var _loc4_:_70;
         (_loc4_ = new _70(param2,param3))._2104 = param1;
         _loc4_.path = param1.path;
         _loc4_._13228 = param1.path;
         if(param1 is _723)
         {
            _loc4_.type = _74.ARMATURE;
            _loc4_.filterType = new _74((param1 as _723)._1886._1811.toString().toLocaleLowerCase());
            _loc5_ = param1.name;
            _loc4_._2116 = _loc5_;
            _loc4_._2117 = _loc5_;
         }
         else
         {
            _loc4_.type = _74.IMAGE;
            _loc4_._2116 = param1.name;
            if(param1 is _737)
            {
               _loc4_._2113 = (param1 as _737).textureName;
            }
            else if(param1 is _726)
            {
               _loc4_._2113 = (param1 as _726).textureName;
            }
            else if(param1 is _14087)
            {
               _loc4_._2113 = (param1 as _14087).textureName;
            }
            _loc4_._2117 = _loc4_._2116.split("/").pop();
         }
         return _loc4_;
      }
      
      public static function _1734(param1:String, param2:int = 0, param3:Object = null) : _70
      {
         var _loc4_:_70;
         (_loc4_ = new _70(param2,param3)).type = _74.IMAGE;
         _loc4_.path = param1;
         _loc4_._13228 = param1;
         var _loc5_:String = param1;
         var _loc6_:Array;
         if((_loc6_ = _loc5_.split("@")).length == 2)
         {
            _loc4_._2113 = _loc6_[0];
            _loc4_._2116 = _loc6_[1];
         }
         else
         {
            _loc4_._2116 = _loc5_;
         }
         _loc4_._2117 = _loc4_._2116.split("/").pop();
         return _loc4_;
      }
      
      public static function _1743(param1:String, param2:int = 0, param3:Object = null) : _70
      {
         var _loc4_:_70;
         (_loc4_ = new _70(param2,param3)).type = _74.ARMATURE;
         _loc4_.path = param1;
         _loc4_._13228 = param1;
         var _loc5_:String = param1;
         _loc4_._2116 = param1;
         _loc4_._2117 = param1;
         return _loc4_;
      }
      
      public static function _11276(param1:_11219, param2:int = 0, param3:Object = null) : _70
      {
         var _loc4_:_70;
         (_loc4_ = new _70(param2,param3)).type = _74.BOUNDINGBOX;
         _loc4_.path = param1.name;
         _loc4_._13228 = param1.name;
         _loc4_._2116 = param1.name;
         _loc4_._2117 = param1.name;
         _loc4_._11278 = param1;
         _loc4_._2104 = new _11251(param1);
         return _loc4_;
      }
      
      private static function get _2106() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
      
      public function set _13228(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc2_:int = int(param1.indexOf("@"));
         if(_loc2_ >= 0)
         {
            _loc3_ = param1.slice(++_loc2_);
         }
         else
         {
            _loc3_ = param1;
         }
         this._14297 = _loc3_;
      }
      
      public function get _13228() : String
      {
         return this._14297;
      }
      
      public function dispose() : void
      {
         this._1733 = null;
         this._1760 = null;
         this._1985 = null;
      }
      
      public function get name() : String
      {
         return this._2116;
      }
      
      public function get _13230() : String
      {
         if(this._13228 != null && this.path != this._13228)
         {
            return this._13228;
         }
         return this.name;
      }
      
      public function get displayIndex() : int
      {
         return !!this._1733 ? this._1733.displayIndex : -1;
      }
      
      public function get _2097() : Boolean
      {
         return this._1760._1711 == this._1733;
      }
      
      public function get _2100() : Boolean
      {
         if(this._1760)
         {
            return this._1760._1923 == this._1733;
         }
         return false;
      }
      
      public function get _2104() : _725
      {
         return this._2101;
      }
      
      public function set _2104(param1:_725) : void
      {
         if(this._2101 == param1)
         {
            return;
         }
         this._2101 = param1;
         if(Boolean(this._2101) && this._2101.missing)
         {
            if(!isNaN(this._1813) && this._1813 > 0)
            {
               this._2101.width = this._1813;
            }
            if(!isNaN(this._1806) && this._1806 > 0)
            {
               this._2101.height = this._1806;
            }
         }
         if(this.type == _74.MESH)
         {
            if(this._2123 == null)
            {
               this._2122();
            }
            else if(Boolean(this._2123) && this._2123._1854 == null)
            {
               this._2091();
            }
         }
      }
      
      public function get width() : Number
      {
         if(this._2101)
         {
            return this._2101.width;
         }
         return 0;
      }
      
      public function get height() : Number
      {
         if(this._2101)
         {
            return this._2101.height;
         }
         return 0;
      }
      
      public function set textureName(param1:String) : void
      {
         this._2113 = param1;
      }
      
      public function get textureName() : String
      {
         return this._2113;
      }
      
      public function get _1814() : String
      {
         return this._2116;
      }
      
      public function _2095(param1:Function) : Boolean
      {
         var callback:Function = param1;
         if(this._2101 is _732)
         {
            (this._2101 as _732)._2095(function(param1:BitmapData):void
            {
               callback(name,param1);
            });
            return true;
         }
         return false;
      }
      
      public function _2099(param1:Function) : Boolean
      {
         var callback:Function = param1;
         if(Boolean(this._2101) && !(this._2101 is _723))
         {
            this._2101._2108(function(param1:*):void
            {
               callback(name,param1);
            });
            return true;
         }
         return false;
      }
      
      public function get _2120() : String
      {
         return this._2117;
      }
      
      public function changePath(param1:String) : void
      {
         this.path = param1;
         var _loc2_:String = param1;
         var _loc3_:Array = _loc2_.split("@");
         if(_loc3_.length == 2)
         {
            this._2113 = _loc3_[0];
            this._2116 = _loc3_[1];
         }
         else
         {
            this._2113 = null;
            this._2116 = _loc2_;
         }
         this._2117 = this._2116.split("/").pop();
      }
      
      public function get _2165() : Boolean
      {
         if(this.type == _74.MESH)
         {
            return true;
         }
         return false;
      }
      
      public function get _2112() : Boolean
      {
         if(this.type == _74.MESH && this.mesh && this.mesh.meshRig != null)
         {
            return true;
         }
         return false;
      }
      
      public function _2110(param1:Mesh) : void
      {
         this.type = _74.MESH;
         if(param1 == null)
         {
            this._2122();
         }
         else
         {
            this._2123 = param1;
         }
         this._2114 = new Vector.<Number>();
      }
      
      private function _2122() : void
      {
         this._2099(this._2092);
      }
      
      private function _2091() : void
      {
         this._2099(this._2096);
      }
      
      private function _2096(param1:String, param2:*) : void
      {
         if(param2 is BitmapData)
         {
            this._2109 = param2 as BitmapData;
            this._2123._2103(this._2109);
         }
      }
      
      private function _2092(param1:String, param2:*) : void
      {
         this._2109 = param2;
         if(this._2109 is BitmapData)
         {
            this._2123 = new Mesh(this._2109);
         }
      }
      
      public function get mesh() : Mesh
      {
         return this._2123;
      }
      
      public function set mesh(param1:Mesh) : void
      {
         this._2123 = param1;
      }
      
      public function get _1903() : _13507
      {
         return this._2098;
      }
      
      public function set _1903(param1:_13507) : void
      {
         this._2098 = param1;
         this.mesh._1903 = this._2098;
      }
      
      public function get _2121() : Vector.<Number>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Vector.<_661> = this._2123._1812;
         var _loc2_:Vector.<_661> = this._2123._2119() ? this._2123._2115 : this._2123._2102;
         this._2114.length = _loc1_.length * 2;
         _loc3_ = 0;
         _loc4_ = int(_loc1_.length);
         while(_loc3_ < _loc4_)
         {
            this._2114[_loc3_ * 2] = _loc2_[_loc3_].x - _loc1_[_loc3_].x;
            this._2114[_loc3_ * 2 + 1] = _loc2_[_loc3_].y - _loc1_[_loc3_].y;
            _loc3_++;
         }
         return this._2114;
      }
      
      public function get _2094() : Vector.<Number>
      {
         return this.mesh._2094;
      }
      
      public function set _2094(param1:Vector.<Number>) : void
      {
         this.mesh._2094 = param1;
      }
      
      public function set _2111(param1:Vector.<Number>) : void
      {
         this._2105 = param1;
      }
      
      public function _2107() : _50
      {
         if(this.type == _74.ARMATURE)
         {
            if(this._2101 is _723)
            {
               return (this._2101 as _723)._1886;
            }
         }
         return null;
      }
      
      public function _1789() : void
      {
         if(this.mesh)
         {
            this.mesh._1789(this._1760.rootArmatureData,this._1760);
         }
      }
      
      public function _11284() : void
      {
         if(this._11278)
         {
            this._2116 = this._11278.name;
            this._2117 = this._11278.name;
         }
      }
      
      public function _14298(param1:_50) : _70
      {
         var _loc3_:_725 = null;
         var _loc4_:Mesh = null;
         var _loc5_:_11219 = null;
         var _loc2_:_70 = new _70();
         switch(this.type)
         {
            case _74.MESH:
               _loc3_ = _2106._3806(this.path);
               if(_loc3_ == null)
               {
                  _loc3_ = new _735(this.path,this._1813,this._1806);
               }
               _loc4_ = this.mesh.clone(param1._1779);
               _loc2_ = _70._2089(_loc4_,_loc3_);
               _loc2_._1760 = this._1760;
               break;
            case _74.ARMATURE:
               break;
            case _74.BOUNDINGBOX:
               _loc5_ = this._11278.clone();
               _loc2_._11278 = _loc5_;
         }
         _loc2_.type = this.type;
         _loc2_.path = this.path;
         _loc2_._2113 = this._2113;
         _loc2_._2116 = this._2116;
         _loc2_._2117 = this._2117;
         _loc2_.localTransform.copyFrom(this.localTransform);
         _loc2_._1806 = this._1806;
         _loc2_._1813 = this._1813;
         _loc2_._13228 = this._13228;
         return _loc2_;
      }
      
      public function clone() : _70
      {
         var _loc2_:Mesh = null;
         var _loc3_:_11219 = null;
         var _loc1_:_70 = new _70();
         _loc1_.type = this.type;
         _loc1_.path = this.path;
         _loc1_._2113 = this._2113;
         _loc1_._2116 = this._2116;
         _loc1_._2117 = this._2117;
         _loc1_.localTransform.copyFrom(this.localTransform);
         _loc1_._1806 = this._1806;
         _loc1_._1813 = this._1813;
         switch(this.type)
         {
            case _74.MESH:
               _loc2_ = this.mesh._12508();
               _loc1_._2110(_loc2_);
               break;
            case _74.ARMATURE:
               break;
            case _74.BOUNDINGBOX:
               _loc3_ = this._11278.clone();
               _loc1_._11278 = _loc3_;
         }
         return _loc1_;
      }
   }
}

