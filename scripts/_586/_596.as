package _586
{
   import _1045.Group;
   import _1045._1105;
   import _13503._13502;
   import _13505._13504;
   import _13505._13507;
   import _13505._13508;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._535;
   import _639._642;
   import _708._715;
   import _724._723;
   import _73._74;
   import _783.StageNotification;
   import _81._88;
   import _859._867;
   import _93._94;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _596 extends _94
   {
      public static const RENDER_ONE_BITMAP:Boolean = true;
      
      private const COLOR_NULL:uint = 0;
      
      private var _5253:Rectangle;
      
      private var _width:int = 1024;
      
      private var _height:int = 1024;
      
      private var _4294:int = 512;
      
      private var _4293:int = 512;
      
      private var _5244:Vector.<_1105>;
      
      private var _3251:_50;
      
      private var _5220:Group;
      
      private var _5222:Group;
      
      private var _5221:_1105;
      
      private var _5223:_1105;
      
      private var _5224:BitmapData;
      
      private var _5226:BitmapData;
      
      private var _5216:ColorTransform;
      
      private var _5217:ColorTransform;
      
      private var _5247:int;
      
      private var _5232:int = 3;
      
      private var _5248:int;
      
      private var _5236:int = 3;
      
      private var _5254:Boolean;
      
      private var _2205:Matrix;
      
      private var _5245:Boolean;
      
      private var _5235:Matrix;
      
      private var _5249:Number;
      
      private var _5250:Number;
      
      private var _5242:Number;
      
      private var _5241:Boolean;
      
      private var _5225:_13502;
      
      private var _5231:Sprite;
      
      private var _5240:Object;
      
      private var _5227:Vector.<_867>;
      
      private var _5219:int;
      
      private var _5234:ColorMatrixFilter;
      
      private var _5239:ColorMatrixFilter;
      
      private var _5228:int;
      
      private var _5230:Boolean;
      
      public function _596()
      {
         this.UINT_MATRIX = new Matrix();
         this._5244 = new Vector.<_1105>();
         this._2205 = new Matrix();
         super();
         this._5216 = new ColorTransform(1,0,0);
         this._5217 = new ColorTransform(0,0,1);
         if(RENDER_ONE_BITMAP)
         {
            this._5253 = new Rectangle(0,0,this._width,this._height);
            this._5221 = new _1105();
            this._5223 = new _1105();
            this._5224 = new BitmapData(this._width,this._height);
            this._5226 = new BitmapData(this._width,this._height);
            this._5235 = new Matrix();
         }
         this._5231 = new Sprite();
         this._5240 = {};
         this._5227 = new Vector.<_867>();
         this._5234 = new ColorMatrixFilter([1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0]);
         this._5239 = new ColorMatrixFilter([0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0]);
      }
      
      override protected function _1576() : void
      {
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864);
         _1565(StageNotification.UPDATE_FILTER_STATUS,this._10363);
      }
      
      private function _10363(param1:StageNotification) : void
      {
         if(this._5254)
         {
            this.open = false;
            this.open = true;
            this.draw();
         }
      }
      
      public function _4738(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_52 = null;
         if(param2)
         {
            if(this._5247 != param1)
            {
               this._5247 = param1;
            }
         }
         else if(this._5248 != param1)
         {
            this._5248 = param1;
         }
      }
      
      private function _3864(param1:StageNotification) : void
      {
         if(_2220._2873 == _715.ARMATURE)
         {
            this.clearCache();
            this._5243();
         }
      }
      
      public function _3444(param1:String, param2:_52) : void
      {
         this.clearCache();
      }
      
      public function draw() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_1105 = null;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:BitmapData = null;
         var _loc8_:int = 0;
         if((_2220._2873 == _715.ANIMATE || _2220._2873 == _715.GENERAL || _2220._2873 == _715.SHEET) && this.open)
         {
            this._5243();
            if(this._5219 - this._4744 >= 0)
            {
               if(this._5228 - (this._5219 - this._4744) >= this._4744)
               {
                  _loc1_ = this._4744;
               }
               else
               {
                  _loc1_ = this._5228 - (this._5219 - this._4744);
                  if(_loc1_ < 0)
                  {
                     _loc1_ = 0;
                  }
               }
            }
            else
            {
               _loc1_ = this._5247 + (this._5219 - this._4744);
               if(_loc1_ < 0)
               {
                  _loc1_ = 0;
               }
            }
            if(this._5219 + this._4751 <= this._5228)
            {
               _loc2_ = this._4751;
            }
            else
            {
               _loc2_ = this._5228 - this._5219;
               if(_loc2_ < 0)
               {
                  _loc2_ = 0;
               }
            }
            _loc5_ = this._5219 > this._5228 ? this._5228 : this._5219;
            _loc6_ = _642.getInstance().imageSmooth;
            if(RENDER_ONE_BITMAP)
            {
               _loc8_ = _loc1_;
               while(_loc8_ > 0)
               {
                  _loc4_ = this._3681(_loc5_ - _loc8_,true);
                  if((Boolean(_loc4_)) && Boolean(_loc4_.bitmapData))
                  {
                     _loc7_ = _loc4_.bitmapData;
                     this._2205.setTo(1,0,0,1,0,0);
                     this._2205.tx = _loc4_.povitX;
                     this._2205.ty = _loc4_.povitY;
                     this._2205.concat(this._5235);
                     this._5216.alphaMultiplier = 1 / (_loc1_ + 1) * (_loc1_ - _loc8_ + 1);
                     this._5224.draw(_loc7_,this._2205,this._5216,null,null,_loc6_);
                  }
                  _loc8_--;
               }
               _loc8_ = 1;
               while(_loc8_ <= _loc2_)
               {
                  _loc4_ = this._3681(this._5219 + _loc8_,true);
                  if((Boolean(_loc4_)) && Boolean(_loc4_.bitmapData))
                  {
                     _loc7_ = _loc4_.bitmapData;
                     this._2205.setTo(1,0,0,1,0,0);
                     this._2205.tx = _loc4_.povitX;
                     this._2205.ty = _loc4_.povitY;
                     this._2205.concat(this._5235);
                     this._5217.alphaMultiplier = 1 - 1 / (_loc2_ + 1) * _loc8_;
                     this._5226.draw(_loc7_,this._2205,this._5217,null,null,_loc6_);
                  }
                  _loc8_++;
               }
               this._5218();
               this._5221.source = this._5224;
               this._5223.source = this._5226;
            }
            else
            {
               _loc8_ = _loc1_;
               while(_loc8_ > 0)
               {
                  _loc3_ = this._5246();
                  _loc4_ = this._3681(_loc5_ - _loc8_);
                  _loc3_.source = _loc4_.bitmapData;
                  _loc3_.filters = [this._5234];
                  _loc3_.alpha = 1 / (_loc1_ + 1) * (_loc1_ - _loc8_ + 1);
                  _loc3_.x = _loc4_.povitX;
                  _loc3_.y = _loc4_.povitY;
                  this._5220.addElement(_loc3_);
                  _loc8_--;
               }
               _loc8_ = 1;
               while(_loc8_ <= _loc2_)
               {
                  _loc3_ = this._5246();
                  _loc4_ = this._3681(this._5219 + _loc8_);
                  _loc3_.source = _loc4_.bitmapData;
                  _loc3_.filters = [this._5239];
                  _loc3_.alpha = 1 - 1 / (_loc2_ + 1) * _loc8_;
                  _loc3_.x = _loc4_.povitX;
                  _loc3_.y = _loc4_.povitY;
                  this._5222.addElement(_loc3_);
                  _loc8_++;
               }
            }
         }
      }
      
      public function _5233(param1:Group, param2:Group) : void
      {
         if(RENDER_ONE_BITMAP)
         {
            if(this._5220 != param1)
            {
               if(this._5220)
               {
                  this._5220.removeElement(this._5221);
               }
               this._5220 = param1;
               if(this._5220)
               {
                  this._5220.addElement(this._5221);
               }
            }
            if(this._5222 != param2)
            {
               if(this._5222)
               {
                  this._5222.removeElement(this._5223);
               }
               this._5222 = param2;
               if(this._5222)
               {
                  this._5222.addElement(this._5223);
               }
            }
         }
         else
         {
            if(this._5220 != param1)
            {
               this._5220 = param1;
            }
            if(this._5222 != param2)
            {
               this._5222 = param2;
            }
         }
      }
      
      private function _5243() : void
      {
         var _loc1_:_1105 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(RENDER_ONE_BITMAP)
         {
            if(this._5245)
            {
               this._5226.dispose();
               this._5226 = new BitmapData(this._width,this._height);
               this._5224.dispose();
               this._5224 = new BitmapData(this._width,this._height);
               this._5245 = false;
               this._5241 = false;
            }
            this._5226.fillRect(this._5253,this.COLOR_NULL);
            this._5224.fillRect(this._5253,this.COLOR_NULL);
         }
         else
         {
            _loc2_ = 0;
            _loc3_ = this._5220.numChildren;
            while(_loc2_ < _loc3_)
            {
               _loc1_ = this._5220.getChildAt(_loc2_) as _1105;
               if(_loc1_)
               {
                  this._5244.push(_loc1_);
               }
               _loc2_++;
            }
            _loc2_ = 0;
            _loc3_ = this._5222.numChildren;
            while(_loc2_ < _loc3_)
            {
               _loc1_ = this._5222.getChildAt(_loc2_) as _1105;
               if(_loc1_)
               {
                  this._5244.push(_loc1_);
               }
               _loc2_++;
            }
            this._5220._2426();
            this._5222._2426();
         }
      }
      
      public function get open() : Boolean
      {
         return this._5254;
      }
      
      public function set open(param1:Boolean) : void
      {
         if(this._5254 != param1)
         {
            this._5254 = param1;
            if(!this._5254)
            {
               this._5243();
               this._5236 = this._5248;
               this._5232 = this._5247;
               this._4738(0,true);
               this._4738(0,false);
               this.clearCache();
            }
            else
            {
               this._4738(this._5232,true);
               this._4738(this._5236,false);
            }
         }
      }
      
      public function get _4744() : int
      {
         return this._5247;
      }
      
      public function get _4751() : int
      {
         return this._5248;
      }
      
      public function get _1886() : _50
      {
         return this._3251;
      }
      
      public function set _1886(param1:_50) : void
      {
         this._3251 = param1;
         this.open = false;
      }
      
      public function _3606(param1:_50) : void
      {
         this._3251 = param1;
      }
      
      public function set _3648(param1:_13502) : void
      {
         if(this._5225 != param1)
         {
            this._5225 = param1;
            this.clearCache();
         }
      }
      
      public function _3604(param1:_13502) : void
      {
         this._5225 = param1;
      }
      
      public function get _3648() : _13502
      {
         return this._5225;
      }
      
      private function _5246() : _1105
      {
         var _loc1_:_1105 = this._5244.pop();
         if(!_loc1_)
         {
            _loc1_ = new _1105();
         }
         return _loc1_;
      }
      
      public function _5252(param1:int, param2:int, param3:Number, param4:Number, param5:Number) : void
      {
         if(RENDER_ONE_BITMAP)
         {
            if(this._height != param2 || this._width != param1)
            {
               this._height = param2;
               this._4293 = this._height / 2;
               this._width = param1;
               this._4294 = this._width / 2;
               this._5253.width = this._width;
               this._5253.height = this._height;
               this._5245 = true;
            }
            if(this._5249 != param4 || this._5250 != param5 || this._5242 != this._5242)
            {
               this._5235.setTo(1,0,0,1,0,0);
               this._5235.scale(param3,param3);
               this._5235.tx = this._4294 + param4;
               this._5235.ty = this._4293 + param5;
               this._5241 = true;
            }
            if(this.open && (this._5241 || this._5245) && (_2220._2873 == _715.ANIMATE || _2220._2873 == _715.GENERAL || _2220._2873 == _715.SHEET))
            {
               this.draw();
            }
         }
      }
      
      public function refresh() : void
      {
         if(this.open)
         {
            this.clearCache();
         }
      }
      
      public function _3696(param1:Number, param2:Rectangle = null) : Object
      {
         return this._5215(param1,true,false,param2);
      }
      
      public function _3681(param1:Number, param2:Boolean = false, param3:Rectangle = null) : Object
      {
         var _loc4_:Object = null;
         if(_2220._2873 == _715.SHEET)
         {
            _loc4_ = this._13358(param1,true,param3);
         }
         else if(param2)
         {
            _loc4_ = this._5215(param1,param2,true,param3);
         }
         else
         {
            _loc4_ = this._5240[param1];
            if(_loc4_ == null)
            {
               _loc4_ = this._5215(param1,false,true,param3);
               if(_loc4_ != null)
               {
                  this._5240[param1] = _loc4_;
               }
            }
         }
         return _loc4_;
      }
      
      public function set _4698(param1:int) : void
      {
         this._5219 = param1;
      }
      
      public function set _4642(param1:int) : void
      {
         this._5228 = param1;
      }
      
      private function _13358(param1:int, param2:Boolean = true, param3:Rectangle = null) : Object
      {
         var _1837:_79;
         var smooth:Boolean;
         var displayVO:_70 = null;
         var image:_867 = null;
         var displayM:Matrix = null;
         var empty:Boolean = false;
         var bmpDWidth:int = 0;
         var bmpDHeight:int = 0;
         var b:Rectangle = null;
         var drawW:Number = NaN;
         var drawH:Number = NaN;
         var bmpD:BitmapData = null;
         var m:Matrix = null;
         var i:int = 0;
         var len:int = 0;
         var tempC:Sprite = null;
         var frameIndex:int = param1;
         var drawBitmap:Boolean = param2;
         var aabb:Rectangle = param3;
         if(!this._3251)
         {
            return null;
         }
         _1837 = this._3251._1780[0];
         smooth = _642.getInstance().imageSmooth;
         if(_1837)
         {
            this._5229();
            displayVO = _1837._13232(frameIndex);
            if(displayVO)
            {
               image = this._5237();
               image._2104 = displayVO._2104;
               displayM = new Matrix();
               _88._2013(displayVO.localTransform,displayM);
               image.transform.matrix = displayM;
               this._5231.addChild(image);
               if(this._5231.width <= 0)
               {
                  empty = true;
               }
               if(this._5231.height <= 0)
               {
                  empty = true;
               }
               bmpDWidth = !empty ? int(this._5231.width) : 1;
               bmpDHeight = !empty ? int(this._5231.height) : 1;
               if(aabb == null)
               {
                  b = this._5231.getBounds(this._5231);
               }
               else
               {
                  b = aabb;
               }
               this._5238(b);
               if(drawBitmap)
               {
                  drawW = b.width;
                  drawH = b.height;
                  if(drawW <= 0)
                  {
                     drawW = 1;
                  }
                  if(drawH <= 0)
                  {
                     drawH = 1;
                  }
                  try
                  {
                     bmpD = new BitmapData(drawW,drawH,true,16777215);
                     m = new Matrix();
                     m.tx = -b.x;
                     m.ty = -b.y;
                     i = 0;
                     len = this._5231.numChildren;
                     if(len > 10)
                     {
                        i = 0;
                        while(i < len)
                        {
                           tempC = this._5231.getChildAt(i) as Sprite;
                           tempC.visible = false;
                           i++;
                        }
                        tempC = null;
                        i = 0;
                        while(i < len)
                        {
                           if(tempC)
                           {
                              tempC.visible = false;
                           }
                           tempC = this._5231.getChildAt(i) as Sprite;
                           tempC.visible = true;
                           bmpD.draw(this._5231,m,null,null,null,smooth);
                           i++;
                        }
                        tempC = null;
                     }
                     else
                     {
                        bmpD.draw(this._5231,m,null,null,null,smooth);
                     }
                  }
                  catch(e:Error)
                  {
                     bmpD = new BitmapData(1,1);
                     return {
                        "bitmapData":bmpD,
                        "povitX":b.x,
                        "povitY":b.y,
                        "empty":true
                     };
                  }
                  return {
                     "bitmapData":bmpD,
                     "povitX":b.x,
                     "povitY":b.y,
                     "empty":empty
                  };
               }
               return {
                  "width":b.width,
                  "height":b.height,
                  "povitX":b.x,
                  "povitY":b.y
               };
            }
         }
         return {
            "width":1,
            "height":1,
            "povitX":0,
            "povitY":0
         };
      }
      
      private function _5215(param1:Number, param2:Boolean = false, param3:Boolean = true, param4:Rectangle = null) : Object
      {
         var bmpDWidth:int;
         var bmpDHeight:int;
         var i:int = 0;
         var len:int = 0;
         var _1880:_13504 = null;
         var _1879:_13508 = null;
         var _1770:_13507 = null;
         var _1837:_79 = null;
         var empty:Boolean = false;
         var b:Rectangle = null;
         var image:_867 = null;
         var drawW:Number = NaN;
         var drawH:Number = NaN;
         var bmpD:BitmapData = null;
         var m:Matrix = null;
         var tempC:Sprite = null;
         var frameIndex:Number = param1;
         var playChildArmature:Boolean = param2;
         var drawBitmap:Boolean = param3;
         var aabb:Rectangle = param4;
         if(!this._3251)
         {
            return null;
         }
         if(this._5225 != null)
         {
            i = 0;
            len = int(this._5225._1746.length);
            while(i < len)
            {
               _1880 = this._5225._1746[i];
               _1880._1947(frameIndex);
               i++;
            }
            i = 0;
            len = int(this._5225._1745.length);
            while(i < len)
            {
               _1879 = this._5225._1745[i];
               _1879._1947(frameIndex);
               i++;
            }
            if(this._5225._1753)
            {
               i = 0;
               len = int(this._5225._1753.length);
               while(i < len)
               {
                  _1770 = this._5225._1753[i];
                  _1770._1947(frameIndex);
                  i++;
               }
            }
            if(Boolean(this._5225._10657) && this._5225._10657._1816.length > 0)
            {
               this._5225._10657._1858(frameIndex);
            }
         }
         else
         {
            this._3251._1976();
         }
         this._3251._1988();
         this._3251._1751();
         this._5229();
         this._5230 = true;
         i = 0;
         len = int(this._3251._1780.length);
         while(i < len)
         {
            _1837 = this._3251._1780[i];
            if(_1837._2049 != null)
            {
               if(_535.instance._3371(_1837))
               {
                  image = this._5237();
                  if(_1837._2049.type == _74.MESH)
                  {
                     image.mesh = _1837._2049.mesh;
                     image._2104 = _1837._2049._2104;
                  }
                  else
                  {
                     image._2104 = _1837._2049._2104;
                     if(playChildArmature && this._5225 != null)
                     {
                        if(_1837._2049._2104 is _723)
                        {
                           image.gotoAndStop(_1837._2158,frameIndex);
                        }
                     }
                  }
                  if(_1837._2112())
                  {
                     image.transform.matrix = this.UINT_MATRIX;
                  }
                  else
                  {
                     image.transform.matrix = _1837._2009;
                  }
                  image.transform.colorTransform = _1837._1926;
                  if(_1837.blendMode)
                  {
                     image.blendMode = _1837.blendMode;
                  }
                  this._5231.addChild(image);
               }
            }
            i++;
         }
         if(this._5231.width <= 0)
         {
            empty = true;
         }
         if(this._5231.height <= 0)
         {
            empty = true;
         }
         bmpDWidth = !empty ? int(this._5231.width) : 1;
         bmpDHeight = !empty ? int(this._5231.height) : 1;
         if(aabb == null)
         {
            b = this._5231.getBounds(this._5231);
         }
         else
         {
            b = aabb;
         }
         this._5238(b);
         if(drawBitmap)
         {
            drawW = b.width;
            drawH = b.height;
            if(drawW <= 0)
            {
               drawW = 1;
            }
            if(drawH <= 0)
            {
               drawH = 1;
            }
            try
            {
               bmpD = new BitmapData(drawW,drawH,true,16777215);
               m = new Matrix();
               m.tx = -b.x;
               m.ty = -b.y;
               i = 0;
               len = this._5231.numChildren;
               if(len > 10)
               {
                  i = 0;
                  while(i < len)
                  {
                     tempC = this._5231.getChildAt(i) as Sprite;
                     tempC.visible = false;
                     i++;
                  }
                  tempC = null;
                  i = 0;
                  while(i < len)
                  {
                     if(tempC)
                     {
                        tempC.visible = false;
                     }
                     tempC = this._5231.getChildAt(i) as Sprite;
                     tempC.visible = true;
                     bmpD.draw(this._5231,m);
                     i++;
                  }
                  tempC = null;
               }
               else
               {
                  bmpD.draw(this._5231,m);
               }
            }
            catch(e:Error)
            {
               bmpD = new BitmapData(1,1);
               return {
                  "bitmapData":bmpD,
                  "povitX":b.x,
                  "povitY":b.y,
                  "empty":true
               };
            }
            return {
               "bitmapData":bmpD,
               "povitX":b.x,
               "povitY":b.y,
               "empty":empty
            };
         }
         return {
            "width":b.width,
            "height":b.height,
            "povitX":b.x,
            "povitY":b.y
         };
      }
      
      private function _5238(param1:Rectangle) : void
      {
         if(Math.abs(param1.left % 1) > 0)
         {
            param1.width += 1;
         }
         if(Math.abs(param1.top % 1) > 0)
         {
            param1.height += 1;
         }
         if(param1.width < 1)
         {
            param1.width = 1;
         }
         if(param1.height < 1)
         {
            param1.height = 1;
         }
         if(param1.x < 0)
         {
            param1.x = -Math.round(-param1.x);
         }
         else
         {
            param1.x = Math.round(param1.x);
         }
         if(param1.y < 0)
         {
            param1.y = -Math.round(-param1.y);
         }
         else
         {
            param1.y = Math.round(param1.y);
         }
      }
      
      private function _5218() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_13504 = null;
         var _loc4_:_13508 = null;
         var _loc5_:_13507 = null;
         var _loc6_:_79 = null;
         if(!this._5230 || !this._5225 || !this._3251)
         {
            return;
         }
         _loc1_ = 0;
         _loc2_ = int(this._5225._1746.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._5225._1746[_loc1_];
            _loc3_._1947(this._5219);
            _loc1_++;
         }
         _loc1_ = 0;
         _loc2_ = int(this._5225._1745.length);
         while(_loc1_ < _loc2_)
         {
            _loc4_ = this._5225._1745[_loc1_];
            _loc4_._1947(this._5219);
            _loc1_++;
         }
         _loc1_ = 0;
         _loc2_ = int(this._5225._1753.length);
         while(_loc1_ < _loc2_)
         {
            _loc5_ = this._5225._1753[_loc1_];
            _loc5_._1947(this._5219);
            _loc1_++;
         }
         this._3251._1988();
         this._3251._1751();
         this._5230 = false;
         if(_loc2_ > 0)
         {
            _1567(new StageNotification(StageNotification.UPDATE_MESH));
         }
      }
      
      private function _5229() : void
      {
         var _loc1_:_867 = null;
         var _loc2_:int = 0;
         var _loc3_:int = this._5231.numChildren;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this._5231.getChildAt(_loc2_) as _867;
            _loc1_.dispose();
            if(_loc1_)
            {
               this._5227.push(_loc1_);
            }
            _loc2_++;
         }
         this._5231.removeChildren();
      }
      
      private function _5237() : _867
      {
         var _loc1_:_867 = null;
         if(this._5227.length > 0)
         {
            _loc1_ = this._5227.pop();
            _loc1_.visible = true;
         }
         else
         {
            _loc1_ = new _867();
         }
         return _loc1_;
      }
      
      public function clearCache() : void
      {
         var _loc1_:Object = null;
         var _loc2_:String = null;
         for(_loc2_ in this._5240)
         {
            _loc1_ = this._5240[_loc2_];
            if(_loc1_)
            {
               (_loc1_.bitmapData as BitmapData).dispose();
            }
            this._5240[_loc2_] = null;
         }
      }
   }
}

