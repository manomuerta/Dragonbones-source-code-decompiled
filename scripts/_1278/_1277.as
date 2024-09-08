package _1278
{
   import _1045._1084;
   import _1045._1085;
   import _1177.ResizeEvent;
   import egret.core._1140;
   import egret.core.ns_egret;
   import egret.utils._1290;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.filters.DropShadowFilter;
   import flash.geom.Matrix;
   
   use namespace ns_egret;
   
   public class _1277 extends _1084
   {
      private static var _2194:Matrix = new Matrix();
      
      ns_egret static var _9050:Array = [new DropShadowFilter(1,270,0,0.3,1,1)];
      
      ns_egret static var _9052:Array = [13948116,5344454,6842472];
      
      ns_egret static var _9049:Array = [12369084,2778528,6645093];
      
      ns_egret static var _9051:Number = 3;
      
      ns_egret static var _9054:Array = [16448250,15395562,5806811,3240884,7829367,10197915];
      
      ns_egret static var _9053:Array = [3355443,16777215];
      
      private var _9072:_1140;
      
      public function _1277()
      {
         this._9072 = new _1140();
         super();
         this.states = ["normal","disabled"];
      }
      
      protected function get graphics() : Graphics
      {
         return this._9072.graphics;
      }
      
      override public function set _6081(param1:_1085) : void
      {
         if(super._6081)
         {
            super._6081.removeEventListener(ResizeEvent.UI_RESIZE,this.onResize);
         }
         if(param1)
         {
            param1.addEventListener(ResizeEvent.UI_RESIZE,this.onResize);
         }
         super._6081 = param1;
      }
      
      private function onResize(param1:ResizeEvent) : void
      {
         _5823(_6081.width,_6081.height);
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._9072.mouseChildren = false;
         this.addElement(this._9072);
      }
      
      override protected function _2519() : void
      {
         super._2519();
         _5823(_6081.width,_6081.height);
      }
      
      protected function invalidateDisplayList() : void
      {
         _5823(_6081.width,_6081.height);
      }
      
      protected function _9056(param1:Number, param2:Number, param3:Number, param4:Number) : Matrix
      {
         _2194.createGradientBox(param3,param4,0.5 * Math.PI,param1,param2);
         return _2194;
      }
      
      protected function _9067(param1:Number, param2:Number, param3:Number, param4:Number) : Matrix
      {
         _2194.createGradientBox(param3,param4,0,param1,param2);
         return _2194;
      }
      
      ns_egret function _9048(param1:Number, param2:Number, param3:Number, param4:Number, param5:uint, param6:uint, param7:Object, param8:Object = null, param9:Graphics = null) : void
      {
         var _loc11_:Object = null;
         var _loc10_:Object = param8;
         if(param8 == null || param8 is Number)
         {
            _loc11_ = param8 == null ? 0 : Number(param8) - 1;
            if(_loc11_ < 0)
            {
               _loc11_ = 0;
            }
            _loc11_ = {
               "tl":_loc11_,
               "tr":_loc11_,
               "bl":_loc11_,
               "br":_loc11_
            };
         }
         else
         {
            _loc11_ = {
               "tl":Math.max(0,_loc10_.tl - 1),
               "tr":Math.max(0,_loc10_.tr - 1),
               "bl":Math.max(0,_loc10_.bl - 1),
               "br":Math.max(0,_loc10_.br - 1)
            };
         }
         this.drawRoundRect(param1,param2,param3,param4,param8,param5,1,this._9056(param1,param2,param3,param4),GradientType.LINEAR,null,{
            "x":param1 + 1,
            "y":param2 + 1,
            "w":param3 - 2,
            "h":param4 - 2,
            "r":_loc11_
         },param9);
         this.drawRoundRect(param1 + 1,param2 + 1,param3 - 2,param4 - 2,_loc11_,param7,1,this._9056(param1 + 1,param2 + 1,param3 - 2,param4 - 2),GradientType.LINEAR,null,null,param9);
         if(param3 > _loc11_.bl + _loc11_.br + 2 && param4 > 1)
         {
            this._6107(param1 + _loc11_.bl,param2 + param4 - 1,param1 + param3 - _loc11_.br,param2 + param4 - 1,param6,param9);
         }
      }
      
      protected function _6107(param1:Number, param2:Number, param3:Number, param4:Number, param5:uint, param6:Graphics = null) : void
      {
         if(param6 == null)
         {
            param6 = this.graphics;
         }
         param6.lineStyle(1,param5);
         param6.moveTo(param1,param2);
         param6.lineTo(param3,param4);
         param6.endFill();
      }
      
      protected function drawRoundRect(param1:Number, param2:Number, param3:Number, param4:Number, param5:Object = null, param6:Object = null, param7:Object = null, param8:Matrix = null, param9:String = "linear", param10:Array = null, param11:Object = null, param12:Graphics = null) : void
      {
         var _loc13_:Number = NaN;
         var _loc14_:Array = null;
         var _loc15_:Object = null;
         if(param12 == null)
         {
            param12 = this.graphics;
         }
         if(param3 == 0 || param4 == 0)
         {
            return;
         }
         if(param6 !== null)
         {
            if(param6 is uint)
            {
               param12.beginFill(uint(param6),Number(param7));
            }
            else if(param6 is Array)
            {
               _loc14_ = param7 is Array ? param7 as Array : [param7,param7];
               if(!param10)
               {
                  param10 = [0,255];
               }
               param12.beginGradientFill(param9,param6 as Array,_loc14_,param10,param8);
            }
         }
         if(!param5)
         {
            param12.drawRect(param1,param2,param3,param4);
         }
         else if(param5 is Number)
         {
            _loc13_ = Number(param5) * 2;
            param12.drawRoundRect(param1,param2,param3,param4,_loc13_,_loc13_);
         }
         else
         {
            _1290.drawRoundRectComplex(param12,param1,param2,param3,param4,param5.tl,param5.tr,param5.bl,param5.br);
         }
         if(param11)
         {
            _loc15_ = param11.r;
            if(_loc15_ is Number)
            {
               _loc13_ = Number(_loc15_) * 2;
               param12.drawRoundRect(param11.x,param11.y,param11.w,param11.h,_loc13_,_loc13_);
            }
            else
            {
               _1290.drawRoundRectComplex(param12,param11.x,param11.y,param11.w,param11.h,_loc15_.tl,_loc15_.tr,_loc15_.bl,_loc15_.br);
            }
         }
         if(param6 !== null)
         {
            param12.endFill();
         }
      }
   }
}

