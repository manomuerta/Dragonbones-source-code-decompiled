package _13207
{
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._71;
   import _51._79;
   import _658._661;
   import _81._91;
   
   public class _13206
   {
      public static const TYPE_COMPLEX:String = "TYPE_COMPLEX";
      
      public static const TYPE_BONE:String = "TYPE_BONE";
      
      public static const TYPE_SLOT:String = "TYPE_SLOT";
      
      public static const TYPE_MESH:String = "TYPE_MESH";
      
      public static const TYPE_DISPLAY:String = "TYPE_DISPLAY";
      
      public static const TYPE_NULL:String = "TYPE_NULL";
      
      public var type:String;
      
      public var _1886:_50;
      
      public var _2922:Vector.<_52>;
      
      public var _13352:Vector.<_79>;
      
      public var _2978:Vector.<_70>;
      
      public var _13224:Vector.<_661>;
      
      public function _13206()
      {
         super();
         this.type = TYPE_NULL;
         this._2922 = new Vector.<_52>();
         this._13352 = new Vector.<_79>();
         this._2978 = new Vector.<_70>();
         this._13224 = new Vector.<_661>();
      }
      
      public function clear() : void
      {
         this._1886 = null;
         this.type = TYPE_NULL;
         this._2922.length = 0;
         this._13352.length = 0;
         this._2978.length = 0;
         this._13224.length = 0;
      }
      
      public function _13350() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_52 = null;
         var _loc5_:_79 = null;
         var _loc6_:_70 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(this._2922.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._2922[_loc2_];
            if(Boolean(this._1886) && this._1886._1779.indexOf(_loc4_) != -1)
            {
               _loc1_.push(_loc4_);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         _loc3_ = int(this._13352.length);
         while(_loc2_ < _loc3_)
         {
            _loc5_ = this._13352[_loc2_];
            if(Boolean(this._1886) && this._1886._1780.indexOf(_loc5_) != -1)
            {
               _loc1_.push(_loc5_);
            }
            _loc2_++;
         }
         _loc2_ = 0;
         _loc3_ = int(this._2978.length);
         while(_loc2_ < _loc3_)
         {
            _loc6_ = this._2978[_loc2_];
            _loc7_ = 0;
            _loc8_ = int(this._1886._1780.length);
            while(_loc7_ < _loc8_)
            {
               _loc5_ = this._1886._1780[_loc7_];
               if(_loc5_)
               {
                  if(_loc5_._2159(_loc6_.name))
                  {
                     _loc1_.push(_loc6_);
                     break;
                  }
               }
               _loc7_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function _13384(param1:_52) : Boolean
      {
         return Boolean(this._1886) && this._1886._1779.indexOf(param1) != -1;
      }
      
      public function _13385(param1:_79) : Boolean
      {
         return Boolean(this._1886) && this._1886._1780.indexOf(param1) != -1;
      }
      
      public function _13383(param1:_70) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_79 = null;
         _loc2_ = 0;
         _loc3_ = int(this._1886._1780.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._1886._1780[_loc2_];
            if(_loc4_)
            {
               if(_loc4_._2159(param1.name))
               {
                  return true;
               }
            }
            _loc2_++;
         }
         return false;
      }
      
      public function _13382(param1:_661) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_70 = null;
         var _loc5_:int = 0;
         if(this._2978.length == 1)
         {
            _loc4_ = this._2978[_loc2_];
            if((Boolean(_loc4_)) && Boolean(_loc4_.mesh))
            {
               _loc2_ = 0;
               _loc3_ = int(this._13224.length);
               if(_loc2_ < _loc3_)
               {
                  return _loc4_.mesh._13382(this._13224[_loc2_]);
               }
            }
         }
         return -1;
      }
      
      public function _13343() : Vector.<_91>
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_70 = null;
         var _loc5_:_661 = null;
         var _loc1_:Vector.<_91> = new Vector.<_91>();
         if(this._2978.length == 1)
         {
            _loc4_ = this._2978[_loc2_];
            if((Boolean(_loc4_)) && Boolean(_loc4_.mesh))
            {
               _loc2_ = 0;
               _loc3_ = int(this._13224.length);
               while(_loc2_ < _loc3_)
               {
                  _loc5_ = _loc4_.mesh._3183(this._13224[_loc2_]);
                  if(_loc5_ != null)
                  {
                     _loc1_.push(_loc5_);
                  }
                  _loc2_++;
               }
            }
         }
         return _loc1_;
      }
      
      public function _5965() : Object
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Object = {};
         var _loc2_:int = 0;
         _loc1_.type = this.type;
         _loc1_.armature = !!this._1886 ? this._1886.name : null;
         _loc1_.bones = [];
         _loc2_ = 0;
         _loc3_ = int(this._2922.length);
         while(_loc2_ < _loc3_)
         {
            if(this._13384(this._2922[_loc2_]))
            {
               _loc1_.bones.push(this._2922[_loc2_].name);
            }
            _loc2_++;
         }
         _loc1_.slots = [];
         _loc2_ = 0;
         _loc3_ = int(this._13352.length);
         while(_loc2_ < _loc3_)
         {
            if(this._13385(this._13352[_loc2_]))
            {
               _loc1_.slots.push(this._13352[_loc2_].name);
            }
            _loc2_++;
         }
         _loc1_._13229 = [];
         _loc2_ = 0;
         _loc3_ = int(this._2978.length);
         while(_loc2_ < _loc3_)
         {
            if(this._2978[_loc2_]._1760)
            {
               _loc1_._13229.push({
                  "_1837":this._2978[_loc2_]._1760.name,
                  "displayVO":this._2978[_loc2_].name
               });
            }
            _loc2_++;
         }
         _loc1_.vertices = [];
         _loc2_ = 0;
         _loc3_ = int(this._13224.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._13382(this._13224[_loc2_]);
            if(_loc4_ >= 0)
            {
               _loc1_.vertices.push(_loc4_);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function _13386(param1:_71, param2:Object) : void
      {
         var _loc4_:int = 0;
         var _loc5_:_52 = null;
         var _loc6_:_79 = null;
         var _loc7_:_70 = null;
         var _loc8_:_661 = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc3_:int = 0;
         this.type = param2.type;
         this._1886 = param1._2107(param2.armature);
         if(this._1886 == null)
         {
            return;
         }
         if(Boolean(param2.bones) && param2.bones.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(param2.bones.length);
            while(_loc3_ < _loc4_)
            {
               _loc5_ = this._1886._1817(param2.bones[_loc3_]);
               if(_loc5_)
               {
                  this._2922.push(_loc5_);
               }
               _loc3_++;
            }
         }
         if(Boolean(param2.slots) && param2.slots.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(param2.slots.length);
            while(_loc3_ < _loc4_)
            {
               _loc6_ = this._1886._1818(param2.slots[_loc3_]);
               if(_loc6_)
               {
                  this._13352.push(_loc6_);
               }
               _loc3_++;
            }
         }
         if(Boolean(param2._13229) && param2._13229.length > 0)
         {
            _loc3_ = 0;
            _loc4_ = int(param2._13229.length);
            while(_loc3_ < _loc4_)
            {
               _loc6_ = this._1886._1818(param2._13229[_loc3_]._1837);
               if(_loc6_)
               {
                  _loc7_ = _loc6_._13233(param2._13229[_loc3_].displayVO);
                  if(_loc7_)
                  {
                     this._2978.push(_loc7_);
                  }
               }
               _loc3_++;
            }
         }
         if(Boolean(param2.vertices) && param2.vertices.length > 0)
         {
            if(this._2978.length == 1)
            {
               _loc7_ = this._2978[0];
               if(_loc7_._2165)
               {
                  _loc3_ = 0;
                  _loc4_ = int(param2.vertices.length);
                  while(_loc3_ < _loc4_)
                  {
                     _loc9_ = int(param2.vertices[_loc3_]);
                     if(_loc7_.mesh._2102.length > _loc9_)
                     {
                        _loc8_ = _loc7_.mesh._2102[_loc9_];
                        if(_loc8_)
                        {
                           this._13224.push(_loc8_);
                        }
                     }
                     _loc3_++;
                  }
               }
            }
         }
         param2.vertices = [];
         _loc3_ = 0;
         _loc4_ = int(this._13224.length);
         while(_loc3_ < _loc4_)
         {
            _loc10_ = this._13382(this._13224[_loc3_]);
            if(_loc10_ >= 0)
            {
               param2.vertices.push(_loc10_);
            }
            _loc3_++;
         }
      }
   }
}

