package _477
{
   import _11111._11110;
   import _120._121;
   import _120._122;
   import _1404._1407;
   import _609._621;
   import egret.utils.FileUtil;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   
   public class ExportGIFTask extends _494
   {
      private static const TRANSPARENT:uint = 0;
      
      private var _3607:String;
      
      private var _3605:String;
      
      private var _3684:int;
      
      private var _13269:Boolean;
      
      private var _14470:String;
      
      private var fileName:String;
      
      private var _14468:Function;
      
      private var _14467:Function;
      
      public function ExportGIFTask(param1:String, param2:String, param3:int, param4:Function, param5:Function, param6:Boolean = false, param7:String = "")
      {
         super();
         this._3607 = param1;
         this._3605 = param2;
         this._3684 = param3;
         this._14468 = param4;
         this._14467 = param5;
         this._13269 = param6;
         this._14470 = param7;
      }
      
      override public function run() : void
      {
         var armatureImageObj:Object;
         var images:Array = null;
         var imageObj:Object = null;
         var _3615:Array = null;
         var leftTop:Point = null;
         var rightBottom:Point = null;
         var _2166:Number = NaN;
         var _2167:Number = NaN;
         var bmpD:BitmapData = null;
         var len:int = 0;
         var total:int = 0;
         var cur:int = 0;
         var sendArrs:Array = null;
         var animName:String = null;
         var maxW:int = 0;
         var maxH:int = 0;
         var m:Matrix = null;
         var j:int = 0;
         var jLen:int = 0;
         var fps:int = 0;
         var bmDs:Array = null;
         var _2376:String = null;
         var obj:Object = null;
         var pixels:ByteArray = null;
         var i:int = 0;
         var ouputPath:String = _3238.ouputPath + _3238.outputFolder;
         _3613.ouputPath = FileUtil.escapePath(ouputPath);
         armatureImageObj = _3613._3614[this._3607];
         if(armatureImageObj)
         {
            _3615 = [];
            leftTop = new Point(int.MAX_VALUE,int.MAX_VALUE);
            rightBottom = new Point(int.MIN_VALUE,int.MIN_VALUE);
            sendArrs = [];
            for(animName in armatureImageObj)
            {
               if(!(this._3605 != null && animName != this._3605 && animName != _495.SINGLE_FLAG))
               {
                  images = armatureImageObj[animName];
                  j = 0;
                  jLen = int(images.length);
                  while(j < jLen)
                  {
                     imageObj = images[j];
                     if(imageObj.assetData == null)
                     {
                        imageObj.assetData = imageObj.bitmapData;
                        delete imageObj.bitmapData;
                     }
                     bmpD = imageObj.assetData;
                     if(bmpD != null)
                     {
                        total++;
                        _2166 = Number(imageObj.povitX);
                        _2167 = Number(imageObj.povitY);
                        if(leftTop.x > _2166)
                        {
                           leftTop.x = _2166;
                        }
                        if(leftTop.y > _2167)
                        {
                           leftTop.y = _2167;
                        }
                        if(rightBottom.x < _2166 + bmpD.width)
                        {
                           rightBottom.x = _2166 + bmpD.width;
                        }
                        if(rightBottom.y < _2167 + bmpD.height)
                        {
                           rightBottom.y = _2167 + bmpD.height;
                        }
                     }
                     j++;
                  }
               }
            }
            maxW = rightBottom.x - leftTop.x;
            maxH = rightBottom.y - leftTop.y;
            images = [];
            try
            {
               for(animName in armatureImageObj)
               {
                  if(!(this._3605 != null && animName != this._3605 && animName != _495.SINGLE_FLAG))
                  {
                     if(!(!_3238.singleFrame && animName != this._14470))
                     {
                        images = armatureImageObj[animName];
                        fps = _3613._3238.exportFrameRate;
                        if(fps <= 0)
                        {
                           fps = 24;
                        }
                        bmDs = [];
                        j = 0;
                        jLen = int(images.length);
                        while(j < jLen)
                        {
                           imageObj = images[j];
                           if(imageObj["assetData"] != null)
                           {
                              m = new Matrix();
                              m.tx = -leftTop.x + imageObj.povitX;
                              m.ty = -leftTop.y + imageObj.povitY;
                              m.scale(_3238.scale,_3238.scale);
                              bmpD = new BitmapData(maxW * _3238.scale,maxH * _3238.scale,!_3238.hasBackground,_3238.backgroundColor);
                              bmpD.draw(imageObj.assetData,m);
                              pixels = new ByteArray();
                              bmpD.copyPixelsToByteArray(bmpD.rect,pixels);
                              pixels.shareable = true;
                              pixels.position = 0;
                              pixels.compress();
                              bmDs.push({
                                 "pixels":pixels,
                                 "width":bmpD.width,
                                 "height":bmpD.height
                              });
                           }
                           j++;
                        }
                        if(this._13269)
                        {
                           this.fileName = this._3607 + ".gif";
                           _2376 = _3613.ouputPath + this.fileName;
                        }
                        else if(_3238.singleFrame)
                        {
                           if(animName == _495.SINGLE_FLAG)
                           {
                              if(this._3605 != null)
                              {
                                 this.fileName = this._3607 + "_" + this._3605 + "_" + this._3684 + ".gif";
                                 _2376 = _3613.ouputPath + this.fileName;
                              }
                              else
                              {
                                 this.fileName = this._3607 + ".gif";
                                 _2376 = _3613.ouputPath + this.fileName;
                              }
                           }
                        }
                        else
                        {
                           this.fileName = this._3607 + "_" + animName + ".gif";
                           _2376 = _3613.ouputPath + this.fileName;
                        }
                        obj = {};
                        obj["hasBG"] = _3238.hasBackground;
                        if(_3238.hasBackground)
                        {
                           obj["color"] = _3238.backgroundColor;
                        }
                        else
                        {
                           obj["color"] = 0;
                        }
                        obj["repeat"] = _3238.repeat;
                        obj["quality"] = _3238.quality;
                        obj["total"] = total;
                        obj["bmDs"] = bmDs;
                        obj["path"] = _2376;
                        sendArrs.push(obj);
                     }
                  }
               }
               try
               {
                  _621.instance.clear();
                  this._14466._14471(sendArrs,this._5516,this.onFail,this.onProgress);
               }
               catch(e:*)
               {
                  fail(ExportController.EXPORT_ERROR_NO_DATA,null);
               }
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("ExportGIFTask::run",e);
               fail(ExportController.EXPORT_ERROR_UNKNOW,null);
            }
         }
         else
         {
            fail(ExportController.EXPORT_ERROR_NO_DATA,null);
         }
      }
      
      private function _5516(param1:Object) : void
      {
         var _loc2_:_122 = new _122();
         _loc2_._2389(new ExportGIFFinishTask(param1["gifBytes"],param1["path"]));
         _loc2_.addEventListener(_121.COMPLETE,this._3700);
         _loc2_.addEventListener(_121.FAIL,this._3700);
         _loc2_.run();
      }
      
      private function onProgress(param1:int, param2:int, param3:int = 1) : void
      {
         var _loc4_:String = "...";
         if(this.fileName)
         {
            _loc4_ = this.fileName;
         }
         if(param3 == 1)
         {
            if(this._14468 != null)
            {
               this._14468(param2,param1,this.fileName);
            }
         }
         else if(this._14467 != null)
         {
            this._14467(param2,param1,this.fileName);
         }
      }
      
      private function onFail() : void
      {
         fail(ExportController.EXPORT_ERROR_NO_DATA,null);
      }
      
      private function _3700(param1:_121) : void
      {
         this._14466._14472();
         param1.target.removeEventListener(_121.COMPLETE,this._3700);
         param1.target.removeEventListener(_121.FAIL,this._3700);
         dispatchEvent(param1);
      }
      
      override public function stop() : void
      {
         super.stop();
         this._14466._14472();
      }
      
      private function get _14466() : _14067
      {
         return _1407.getInstance(_14067);
      }
   }
}

