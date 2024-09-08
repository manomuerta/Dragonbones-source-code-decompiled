package _658
{
   import _51._70;
   import _51._79;
   import _652._655;
   import _652._656;
   import _93._95;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class _659 extends _95
   {
      private var _3670:_70;
      
      private var _2123:Mesh;
      
      private var _4213:_79;
      
      private var _5711:Boolean;
      
      private var _5708:_661;
      
      private var _5174:_661;
      
      private var _3822:Vector.<_661>;
      
      private var _11159:Vector.<_661>;
      
      private var _11157:Vector.<_661>;
      
      private var _5709:Vector.<_661>;
      
      private var _5710:Vector.<_661>;
      
      private var _5749:Vector.<_661>;
      
      private var _11736:Vector.<Point>;
      
      private var _1857:Number = 1;
      
      private var _11735:Boolean;
      
      public var _4266:Vector.<_661>;
      
      public var _4265:_661;
      
      public var _12695:Vector.<_661>;
      
      public var _14691:Vector.<_661>;
      
      public function _659(param1:_70)
      {
         super();
         this._3670 = param1;
         this._4213 = this._3670._1760;
         this._2123 = this._3670.mesh;
         this._5710 = new Vector.<_661>(2);
         this._5709 = new Vector.<_661>(2);
         this._5749 = new Vector.<_661>(2);
         this._11159 = new Vector.<_661>();
         this._11157 = new Vector.<_661>();
         this._11736 = new Vector.<Point>();
      }
      
      public function get vo() : _70
      {
         return this._3670;
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
      
      public function set invalid(param1:Boolean) : void
      {
         this._5711 = param1;
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
         this._2466();
      }
      
      public function get _4358() : _661
      {
         return this._5174;
      }
      
      public function set _4358(param1:_661) : void
      {
         if(this._5174 != param1)
         {
            this._5174 = param1;
            this._2466();
         }
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
      
      public function _4226(param1:_661, param2:_661) : void
      {
         if(this._5749[0] != param1 || this._5749[1] != param2)
         {
            this._5749[0] = param1;
            this._5749[1] = param2;
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
      
      public function get _5750() : Vector.<_661>
      {
         return this._5749;
      }
      
      public function _2466() : void
      {
         if(!this._5711)
         {
            this._5711 = true;
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function _4208(param1:_661, param2:_661) : void
      {
         this._5710[0] = param1;
         this._5710[1] = param2;
         this._2466();
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
            this._2466();
         }
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
         this._11159.length = 0;
         this._11157.length = 0;
         if(this._3822)
         {
            _loc1_ = 0;
            _loc2_ = int(this._3822.length);
            while(_loc1_ < _loc2_)
            {
               _loc3_ = _loc1_ + 1;
               _loc4_ = int(this._3822.length);
               while(_loc3_ < _loc4_)
               {
                  if(this._11161(this._3822[_loc1_],this._3822[_loc3_]))
                  {
                     this._11159.push(this._3822[_loc1_],this._3822[_loc3_]);
                  }
                  else if(this._11156(this._3822[_loc1_],this._3822[_loc3_]))
                  {
                     this._11157.push(this._3822[_loc1_],this._3822[_loc3_]);
                  }
                  _loc3_++;
               }
               _loc1_++;
            }
         }
      }
      
      public function _11156(param1:_661, param2:_661) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._2123)
         {
            _loc3_ = 0;
            _loc4_ = int(this._2123.outline.length);
            while(_loc3_ < _loc4_)
            {
               if(param1 == this._2123.outline[_loc3_] && param2 == this._2123.outline[_loc3_ + 1] || param1 == this._2123.outline[_loc3_ + 1] && param2 == this._2123.outline[_loc3_])
               {
                  return true;
               }
               _loc3_ += 2;
            }
         }
         return false;
      }
      
      public function _11161(param1:_661, param2:_661) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._2123)
         {
            _loc3_ = 0;
            _loc4_ = int(this._2123.userEdges.length);
            while(_loc3_ < _loc4_)
            {
               if(param1 == this._2123.userEdges[_loc3_] && param2 == this._2123.userEdges[_loc3_ + 1] || param1 == this._2123.userEdges[_loc3_ + 1] && param2 == this._2123.userEdges[_loc3_])
               {
                  return true;
               }
               _loc3_ += 2;
            }
         }
         return false;
      }
      
      public function clear() : void
      {
         this._5711 = false;
         this._5174 = null;
         this._3822 = null;
      }
      
      public function get _2118() : Vector.<_661>
      {
         return this._2123._2118;
      }
      
      public function get _1837() : _79
      {
         return this._4213;
      }
      
      public function get _11669() : Vector.<Point>
      {
         return this._11736;
      }
      
      public function set _11663(param1:Boolean) : void
      {
         if(this._11735 != param1)
         {
            this._11735 = param1;
            this._2466();
         }
      }
      
      public function get _11663() : Boolean
      {
         return this._11735;
      }
      
      public function _5706(param1:_656) : _661
      {
         return this._2123._3183(param1);
      }
   }
}

