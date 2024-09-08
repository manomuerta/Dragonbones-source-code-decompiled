package _609
{
   import _1177.CloseEvent;
   import _1374.Alert;
   import _204._203;
   import _204._212;
   import _477.ExportController;
   import egret.utils.tr;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.IBitmapDrawable;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _613 extends _620
   {
      public function _613()
      {
         super();
      }
      
      override public function run() : void
      {
         var _3616:Object;
         var textureBmpObj:Object;
         var _3689:Matrix;
         var i:int;
         var len:int;
         var _2503:Function;
         var imageObj:Object = null;
         var bmpD:BitmapData = null;
         var smoothing:Boolean = false;
         var drawableDisplay:IBitmapDrawable = null;
         var textureRect:Rectangle = null;
         var _5415:Number = NaN;
         var alert:Alert = null;
         var display:DisplayObject = null;
         var rectOffSet:Rectangle = null;
         if(_3613._5413)
         {
            complete();
            return;
         }
         if(_3613.images.length <= 0)
         {
            complete();
            return;
         }
         _3616 = {};
         textureBmpObj = {};
         _3689 = new Matrix();
         i = 0;
         len = int(_3613.images.length);
         while(i < len)
         {
            imageObj = _3613.images[i];
            _3616[imageObj.name] = {
               "name":imageObj.name,
               "x":0,
               "y":0,
               "width":imageObj.width,
               "height":imageObj.height,
               "page":0
            };
            i++;
         }
         textureRect = _212._2833(_3608.maxWidth,_3608.maxHeight,_3608.gapX,_3608.gapY,_3616,_3608._2832,_3608.heuristic);
         if(textureRect == null)
         {
            if(_3608.scale > 1)
            {
               _5415 = 1 / _3608.scale;
               fail(ExportController.EXPORT_ERROR_TOO_LARGE,_5415);
            }
            else
            {
               fail(ExportController.EXPORT_ERROR_SIZE_SMALL,null);
            }
            return;
         }
         if(textureRect.width > _203.MAX_BITMAP_WIDTH || textureRect.height > _203.MAX_BITMAP_HEIGHT)
         {
            _2503 = function(param1:CloseEvent):void
            {
               var _loc2_:Number = NaN;
               var _loc3_:Number = NaN;
               if(param1.detail == Alert.FIRST_BUTTON)
               {
                  _loc2_ = _203.MAX_BITMAP_WIDTH / textureRect.width;
                  _loc3_ = _203.MAX_BITMAP_HEIGHT / textureRect.height;
                  if(_loc2_ > _loc3_)
                  {
                     _loc2_ = _loc3_;
                  }
                  fail(ExportController.EXPORT_ERROR_TOO_LARGE,_loc2_);
               }
               else if(param1.detail == Alert.SECOND_BUTTON)
               {
                  fail(ExportController.EXPORT_ERROR_TOO_LARGE_WH,1024);
               }
               else
               {
                  fail(ExportController.EXPORT_ERROR_CLOSE);
               }
            };
            alert = Alert.show(tr("Export.tooLarge.alert"),"",null,_2503,tr("Export.tooLarge.scale"),tr("Export.tooLarge.mult"),tr("Alert.Cancel"));
         }
         else
         {
            _3613._3616 = _3616;
            i = 0;
            len = int(_3613.images.length);
            while(i < len)
            {
               imageObj = _3613.images[i];
               bmpD = new BitmapData(imageObj.width,imageObj.height,true,16777215);
               smoothing = _3608.smooth;
               _3689.identity();
               if(imageObj.originFrameX)
               {
                  _3689.tx = imageObj.originFrameX;
               }
               if(imageObj.originFrameY)
               {
                  _3689.ty = imageObj.originFrameY;
               }
               drawableDisplay = imageObj.assetData as IBitmapDrawable;
               if(drawableDisplay is Sprite)
               {
                  display = drawableDisplay as DisplayObject;
                  rectOffSet = display.getBounds(display);
                  _3689.tx -= rectOffSet.x;
                  _3689.ty -= rectOffSet.y;
               }
               if(_3608.scale != 1)
               {
                  _3689.scale(_3608.scale,_3608.scale);
               }
               bmpD.draw(drawableDisplay,_3689,null,null,null,smoothing);
               textureBmpObj[imageObj.name] = bmpD;
               i++;
            }
            _3613._3691 = _203._2794(textureBmpObj,_3616,textureRect.width,textureRect.height);
            for each(bmpD in textureBmpObj)
            {
               if(bmpD)
               {
                  bmpD.dispose();
               }
            }
            _3613._5413 = true;
            _3613._3608._5412 = false;
            complete();
         }
      }
   }
}

