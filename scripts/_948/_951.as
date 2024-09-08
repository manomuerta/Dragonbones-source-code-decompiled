package _948
{
   import _1045._1105;
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _521._528;
   import _521._535;
   import _639._642;
   import _724._14085;
   import _724._14087;
   import _724._726;
   import _724._732;
   import _73._74;
   import _81._83;
   import _859.LibraryImage;
   import _859._11257;
   import _859._14095;
   import _859._858;
   import _859._860;
   import _859._861;
   import _859._864;
   import _859._865;
   import _953._958;
   import _97._100;
   import egret.core._1140;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _951 extends _949
   {
      public static var _13330:Boolean;
      
      private var _display:_860;
      
      private var _1919:Boolean = false;
      
      private var _6045:LibraryImage;
      
      private var _14743:_14095;
      
      private var _6043:_861;
      
      private var _6041:_865;
      
      private var _6046:_864;
      
      private var _11478:_11257;
      
      private var _13446:_1105;
      
      private var _6745:Object;
      
      public function _951()
      {
         super();
         addEventListener(Event.REMOVED_FROM_STAGE,this._4330);
         addEventListener(Event.ADDED_TO_STAGE,this._4333);
      }
      
      private function _4333(param1:Event) : void
      {
         if(this._6745)
         {
            data = this._6745;
            this._6745 = null;
         }
      }
      
      private function _4330(param1:Event) : void
      {
         this._6745 = data;
         data = null;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._13446 = new _1105();
         addElement(this._13446);
      }
      
      override protected function _6731() : Matrix
      {
         if(Boolean(this._1824) && Boolean(this._1824._2049))
         {
            if(this._1824._2112())
            {
               return _6740;
            }
            return this._1824._2009;
         }
         return _6740;
      }
      
      override public function _1751() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.transform.matrix = this._6731();
      }
      
      override public function _1988() : void
      {
         var _loc1_:_1140 = null;
         if(this._1824 && this._1824._2049 && !_535.instance._11294 && (_535.instance._3371(this._1824) && _535.instance._3880 || owner is _958 && (owner as _958)._2889.indexOf(this._1824) != -1 || _6741))
         {
            _loc1_ = this._11479() as _1140;
            if(_loc1_ == null)
            {
               return;
            }
            if(this._display is _864)
            {
               this._6046.mesh = (this._1824._2049 as _70).mesh;
               if(this._6046.mesh)
               {
                  this._6046.mesh._2104 = this._1824._2049._2104;
               }
            }
            else
            {
               if(this._display is _11257)
               {
                  this._11478._11278 = this._1824._2049._11278;
               }
               else if(this._display is _861)
               {
                  (this._display as _861)._14759(this._1824.curFrameIndex,this._1824._14309);
                  (this._display as _861).animation = this._1824.currentAnimation;
                  (this._display as _861)._3144 = this._3144;
               }
               (_loc1_ as _860)._2104 = this._1824._2049._2104;
            }
            if(_loc1_.parent != this)
            {
               addElement(_loc1_);
            }
            if(this._1919 || Boolean(this._1824._1926))
            {
               if(this._1824._1926)
               {
                  _loc1_.transform.colorTransform = this._1824._1926;
                  this._1919 = true;
               }
               else
               {
                  _loc1_.transform.colorTransform = _83._1920;
                  this._1919 = false;
               }
            }
            if(this._1824.blendMode)
            {
               this.blendMode = this._1824.blendMode;
            }
            if(_13330)
            {
               this._13446.graphics.clear();
               this._13446.graphics.lineStyle(0,_100._2257);
               this._13446.graphics.beginFill(0,0);
               this._13446.graphics.drawRect(-this._1824._2049.width / 2,-this._1824._2049.height / 2,this._1824._2049.width,this._1824._2049.height);
               this._13446.graphics.endFill();
               addElement(this._13446);
            }
            else
            {
               this._13446.graphics.clear();
            }
            this.visible = this._1824._13682;
         }
         else
         {
            this._6744();
         }
      }
      
      private function _3144(param1:Rectangle) : void
      {
         if(this._1824 && this._1824._2049 && this._1824._2049.type == _74.ARMATURE)
         {
            this._1824._2049._14296 = param1;
         }
      }
      
      override public function set _4901(param1:Boolean) : void
      {
         super._4901 = param1;
         this._1988();
      }
      
      override public function set _2080(param1:String) : void
      {
         if(_6203 == param1)
         {
            return;
         }
         super._2080 = param1;
         if(param1 == "up" && !(_535.instance._3371(this._1824) && _535.instance._3880))
         {
            this._1988();
         }
      }
      
      public function get _1824() : _79
      {
         return _data as _79;
      }
      
      public function get _5269() : Boolean
      {
         var _loc1_:_1140 = this._11479() as _1140;
         return Boolean(_loc1_) && _loc1_.parent == this;
      }
      
      private function get _6211() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
      
      private function _11479() : _860
      {
         if(!this._1824 || !this._1824._2049)
         {
            return null;
         }
         if(this._1824._2049.type == _74.ARMATURE)
         {
            if(this._6043 == null)
            {
               this._6043 = new _861();
            }
            if(this._display != this._6043)
            {
               _2426();
               addElement(this._6043);
               this._display = this._6043;
            }
         }
         else if(Boolean(this._1824._2049) && this._1824._2049.type == _74.MESH)
         {
            if(this._6046 == null)
            {
               this._6046 = new _864();
            }
            if(this._display != this._6046)
            {
               _2426();
               this._6046.mesh = this._1824._2049.mesh;
               this._display = this._6046;
            }
         }
         else if(this._1824._2049.type == _74.BOUNDINGBOX)
         {
            if(this._11478 == null)
            {
               this._11478 = new _11257();
            }
            if(this._display != this._11478)
            {
               _2426();
               this._display = this._11478;
            }
         }
         else if(this._1824._2049._2104 is _732)
         {
            if(this._6045 == null)
            {
               this._6045 = new LibraryImage();
            }
            if(this._6045._6358 != _642.getInstance().imageSmooth)
            {
               this._6045._6358 = _642.getInstance().imageSmooth;
               this._6045._6357();
            }
            if(this._display != this._6045)
            {
               _2426();
               this._display = this._6045;
            }
         }
         else if(this._1824._2049._2104 is _726 || this._1824._2049._2104 is _14087)
         {
            if(this._6041 == null)
            {
               this._6041 = new _865();
            }
            if(this._display != this._6041)
            {
               _2426();
               this._display = this._6041;
            }
         }
         else if(this._1824._2049._2104 is _14085)
         {
            if(this._14743 == null)
            {
               this._14743 = new _14095();
            }
            if(this._display != this._14743)
            {
               _2426();
               this._display = this._14743;
            }
         }
         return this._display;
      }
      
      private function _6744() : void
      {
         _2426();
      }
      
      public function get AABB() : Rectangle
      {
         if(this._display is _858)
         {
            return (this._display as _858).AABB;
         }
         return null;
      }
   }
}

