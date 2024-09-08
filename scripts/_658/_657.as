package _658
{
   import _51._52;
   import _51._70;
   import _51._79;
   import _652._655;
   import _652._656;
   import _93._95;
   import _97._100;
   import flash.events.Event;
   
   public class _657 extends _95
   {
      private var _3670:_70;
      
      private var _2123:Mesh;
      
      private var _4213:_79;
      
      private var _5711:Boolean;
      
      private var _5708:_661;
      
      private var _3822:Vector.<_661>;
      
      private var _5709:Vector.<_661>;
      
      private var _11159:Vector.<_661>;
      
      private var _11157:Vector.<_661>;
      
      private var _5710:Vector.<_661>;
      
      private var _1857:Number = 1;
      
      public var _4266:Vector.<_661>;
      
      public var _4265:_661;
      
      public function _657(param1:_70)
      {
         super();
         this._3670 = param1;
         this._2123 = this._3670.mesh;
         this._5710 = new Vector.<_661>(2);
         this._5709 = new Vector.<_661>(2);
         this._11159 = new Vector.<_661>();
         this._11157 = new Vector.<_661>();
      }
      
      public function get vo() : _70
      {
         return this._3670;
      }
      
      public function _5714(param1:_661) : _662
      {
         if(Boolean(this._2123) && Boolean(this._2123.meshRig))
         {
            return this._2123.meshRig._5209(param1);
         }
         return null;
      }
      
      public function _5707(param1:_52) : uint
      {
         var _loc2_:int = int(this._2123.meshRig._2922.indexOf(param1));
         if(_loc2_ >= 0)
         {
            return _100.RIG_BONE_COLOR[_loc2_ % _100.RIG_BONE_COLOR.length];
         }
         return 0;
      }
      
      public function _5706(param1:_656) : _661
      {
         return this._2123._3183(param1);
      }
      
      public function get meshRig() : _660
      {
         return this._2123.meshRig;
      }
      
      public function get vertices() : Vector.<_661>
      {
         return this._2123.vertices;
      }
      
      public function get triangles() : Vector.<_655>
      {
         return this._2123.triangles;
      }
      
      public function get outline() : Vector.<_661>
      {
         return this._2123.outline;
      }
      
      public function get userEdges() : Vector.<_661>
      {
         return this._2123.userEdges;
      }
      
      public function get _1812() : Vector.<_661>
      {
         return this._2123._1812;
      }
      
      public function get _2118() : Vector.<_661>
      {
         return this._2123._2118;
      }
      
      public function set invalid(param1:Boolean) : void
      {
         this._5711 = param1;
      }
      
      public function isSelected(param1:_661) : Boolean
      {
         if(Boolean(this._3822) && Boolean(param1))
         {
            return this._3822.indexOf(param1) != -1;
         }
         return false;
      }
      
      public function _5155() : Boolean
      {
         if(Boolean(this._3822) && Boolean(this._5708))
         {
            return this._3822.indexOf(this._5708) != -1;
         }
         return false;
      }
      
      public function get _4209() : _661
      {
         return this._5708;
      }
      
      public function set _4209(param1:_661) : void
      {
         if(this._5708 != param1)
         {
            this._5708 = param1;
            this._2466();
         }
      }
      
      public function get _3823() : Vector.<_661>
      {
         return this._3822;
      }
      
      public function set _3823(param1:Vector.<_661>) : void
      {
         this._3822 = param1;
         this._11148();
         this._2466();
      }
      
      public function _4231(param1:_661, param2:_661) : void
      {
         if(this._5709[0] != param1 || this._5709[1] != param2)
         {
            this._5709[0] = param1;
            this._5709[1] = param2;
            this._2466();
         }
      }
      
      public function get _5712() : Vector.<_661>
      {
         return this._5710;
      }
      
      public function get _5713() : Vector.<_661>
      {
         return this._5709;
      }
      
      public function _2466() : void
      {
         this._5711 = true;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function _4208(param1:_661, param2:_661) : void
      {
         if(this._5710[0] != param1)
         {
            this._5710[0] = param1;
            this._5710[1] = param2;
            this._2466();
         }
      }
      
      public function get width() : Number
      {
         return this._3670.mesh.maxWidth;
      }
      
      public function get height() : Number
      {
         return this._3670.mesh.maxHeight;
      }
      
      public function get scale() : Number
      {
         return this._1857;
      }
      
      public function set scale(param1:Number) : void
      {
         if(this._1857 != param1)
         {
            this._1857 = param1;
            this._5711 = false;
            this._2466();
         }
      }
      
      public function get _1837() : _79
      {
         return this._3670._1760;
      }
      
      public function get _11160() : Vector.<_661>
      {
         return this._11159;
      }
      
      public function get _11158() : Vector.<_661>
      {
         return this._11157;
      }
      
      public function _11148() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Vector.<_661> = null;
         this._11159.length = 0;
         this._11157.length = 0;
         if(this._3822 == null)
         {
            return;
         }
         _loc1_ = 0;
         _loc2_ = int(this._3822.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = _loc1_ + 1;
            _loc4_ = int(this._3822.length);
            while(_loc3_ < _loc4_)
            {
               _loc5_ = this._11161(this._3822[_loc1_],this._3822[_loc3_]);
               if(_loc5_)
               {
                  this._11159.push(_loc5_[0],_loc5_[1]);
               }
               else
               {
                  _loc5_ = this._11156(this._3822[_loc1_],this._3822[_loc3_]);
                  if(_loc5_)
                  {
                     this._11157.push(_loc5_[0],_loc5_[1]);
                  }
               }
               _loc3_++;
            }
            _loc1_++;
         }
      }
      
      public function _11156(param1:_661, param2:_661) : Vector.<_661>
      {
         var _loc3_:_661 = null;
         var _loc4_:_661 = null;
         var _loc5_:Vector.<_661> = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this._2123)
         {
            _loc6_ = 0;
            _loc7_ = int(this._2123.outline.length);
            while(_loc6_ < _loc7_)
            {
               _loc3_ = this._2123._3183(this._2123.outline[_loc6_]);
               _loc4_ = this._2123._3183(this._2123.outline[_loc6_ + 1]);
               if(param1 == _loc3_ && param2 == _loc4_ || param1 == _loc4_ && param2 == _loc3_)
               {
                  _loc5_ = new Vector.<_661>();
                  _loc5_.push(this._2123.outline[_loc6_]);
                  _loc5_.push(this._2123.outline[_loc6_ + 1]);
                  return _loc5_;
               }
               _loc6_ += 2;
            }
         }
         return null;
      }
      
      public function _11161(param1:_661, param2:_661) : Vector.<_661>
      {
         var _loc3_:_661 = null;
         var _loc4_:_661 = null;
         var _loc5_:Vector.<_661> = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this._2123)
         {
            _loc6_ = 0;
            _loc7_ = int(this._2123.userEdges.length);
            while(_loc6_ < _loc7_)
            {
               _loc3_ = this._2123._3183(this._2123.userEdges[_loc6_]);
               _loc4_ = this._2123._3183(this._2123.userEdges[_loc6_ + 1]);
               if(param1 == _loc3_ && param2 == _loc4_ || param1 == _loc4_ && param2 == _loc3_)
               {
                  _loc5_ = new Vector.<_661>();
                  _loc5_.push(this._2123.userEdges[_loc6_]);
                  _loc5_.push(this._2123.userEdges[_loc6_ + 1]);
                  return _loc5_;
               }
               _loc6_ += 2;
            }
         }
         return null;
      }
   }
}

