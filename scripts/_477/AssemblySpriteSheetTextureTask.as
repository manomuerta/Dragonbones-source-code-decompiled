package _477
{
   import _11111._11110;
   import _609._621;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class AssemblySpriteSheetTextureTask extends _494
   {
      private var _3607:String;
      
      private var _3605:Array;
      
      public function AssemblySpriteSheetTextureTask(param1:String, param2:Array)
      {
         super();
         this._3607 = param1;
         this._3605 = param2;
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
         var i:int = 0;
         var len:int = 0;
         var animName:String = null;
         var maxW:int = 0;
         var maxH:int = 0;
         var m:Matrix = null;
         var j:int = 0;
         var jLen:int = 0;
         var image:Object = null;
         _3613._3609._3610 = false;
         _3613._3609._3611 = false;
         armatureImageObj = _3613._3614[this._3607];
         if(armatureImageObj)
         {
            _3615 = [];
            leftTop = new Point(int.MAX_VALUE,int.MAX_VALUE);
            rightBottom = new Point(int.MIN_VALUE,int.MIN_VALUE);
            for(animName in armatureImageObj)
            {
               if(!(this._3605.indexOf(animName) == -1 && animName != _495.SINGLE_FLAG))
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
                     if(bmpD)
                     {
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
                        if(!imageObj.empty && imageObj.assetData != null)
                        {
                           _3615.push(imageObj);
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
               if(Boolean(_3615) && _3615.length > 0)
               {
                  i = 0;
                  len = int(_3615.length);
                  while(i < len)
                  {
                     m = new Matrix();
                     m.tx = -leftTop.x + _3615[i].povitX;
                     m.ty = -leftTop.y + _3615[i].povitY;
                     bmpD = new BitmapData(maxW,maxH,true,0);
                     bmpD.draw(_3615[i].assetData,m);
                     image = {
                        "name":_3615[i].name,
                        "assetData":bmpD
                     };
                     images.push(image);
                     i++;
                  }
                  _3613._3609.type = _621.TYPE_SPRITESHEET;
                  _3613._3609.images = images;
                  _3613._3609._3608.images = images;
                  complete();
               }
               else
               {
                  fail(ExportController.EXPORT_ERROR_NO_DATA,null);
               }
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("AssemblySpriteSheetTextureTask::run",e);
               switch(e.errorID)
               {
                  case 2015:
                     fail(ExportController.EXPORT_ERROR_PACK,null);
                     break;
                  default:
                     fail(ExportController.EXPORT_ERROR_UNKNOW,null);
               }
            }
         }
         else
         {
            fail(ExportController.EXPORT_ERROR_NO_DATA,null);
         }
      }
   }
}

