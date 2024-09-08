package _586
{
   import _11106._11108;
   import _11111._11110;
   import _1404._1407;
   import _14255._14259;
   import _35._34;
   import _35._36;
   import _470._469;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._528;
   import _555.LibraryPanelController;
   import _625._627;
   import _708._715;
   import _724._725;
   import _73.SymbolType;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _783.TipNotification;
   import _93._94;
   import _953._960;
   import _97._118;
   import _97._124;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.desktop.Clipboard;
   import flash.desktop.ClipboardFormats;
   import flash.desktop.NativeDragActions;
   import flash.desktop.NativeDragManager;
   import flash.display.InteractiveObject;
   import flash.events.NativeDragEvent;
   import flash.filesystem.File;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   
   public class StageDragController extends _94
   {
      public static const EXTENSION_JSON:String = "json";
      
      public static const EXTENSION_XML:String = "xml";
      
      public static const EXTENSION_AMF3:String = "amf3";
      
      public static const EXTENSION_PNG:String = "png";
      
      public static const EXTENSION_JPG:String = "jpg";
      
      public static const EXTENSION_JPEG:String = "jpeg";
      
      public static const EXTENSION_ZIP:String = "zip";
      
      public static const EXTENSION_PSD:String = "psd";
      
      public static const EXTENSION_SVG:String = "svg";
      
      public static const EXTENSION_SWF:String = "swf";
      
      public static const EXTENSION_DBPROJECT:String = "dbproj";
      
      private var _5141:_960;
      
      private var _4186:int;
      
      private var _5148:InteractiveObject;
      
      private var _5146:Array;
      
      public function StageDragController()
      {
         this._5146 = [EXTENSION_JSON,EXTENSION_XML,EXTENSION_AMF3,EXTENSION_PNG,EXTENSION_JPG,EXTENSION_JPEG,EXTENSION_ZIP,EXTENSION_PSD,EXTENSION_SVG,EXTENSION_SWF,EXTENSION_DBPROJECT];
         super();
      }
      
      public function set stageView(param1:_960) : void
      {
         if(this._5141 != param1)
         {
            if(this._5141)
            {
               this._5141.removeEventListener(NativeDragEvent.NATIVE_DRAG_ENTER,this.onDragIn);
               this._5141.removeEventListener(NativeDragEvent.NATIVE_DRAG_DROP,this.onDragIn);
               this._5141.removeEventListener(NativeDragEvent.NATIVE_DRAG_EXIT,this.onDragIn);
            }
            this._5141 = param1;
            this._5141.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER,this.onDragIn);
            this._5141.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP,this.onDragIn);
            this._5141.addEventListener(NativeDragEvent.NATIVE_DRAG_EXIT,this.onDragIn);
         }
      }
      
      public function set welcomePage(param1:InteractiveObject) : void
      {
         if(this._5148 != param1)
         {
            if(this._5148)
            {
               this._5148.removeEventListener(NativeDragEvent.NATIVE_DRAG_ENTER,this.onDragIn);
               this._5148.removeEventListener(NativeDragEvent.NATIVE_DRAG_DROP,this.onDragIn);
               this._5148.removeEventListener(NativeDragEvent.NATIVE_DRAG_EXIT,this.onDragIn);
            }
            this._5148 = param1;
            this._5148.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER,this.onDragIn);
            this._5148.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP,this.onDragIn);
            this._5148.addEventListener(NativeDragEvent.NATIVE_DRAG_EXIT,this.onDragIn);
         }
      }
      
      private function onDragIn(param1:NativeDragEvent) : void
      {
         var curTarget:InteractiveObject;
         var inWelcome:Boolean = false;
         var transferable:Clipboard = null;
         var path:String = null;
         var filePaths:Array = null;
         var data:Object = null;
         var _3710:int = 0;
         var dragFile:File = null;
         var f:File = null;
         var extension:String = null;
         var pngSize:Array = null;
         var file:File = null;
         var dirPath:String = null;
         var pngByte:ByteArray = null;
         var depressData:_36 = null;
         var imageFiles:Vector.<File> = null;
         var imageFile:File = null;
         var e:NativeDragEvent = param1;
         if(e.target != e.currentTarget)
         {
            return;
         }
         inWelcome = e.currentTarget == this._5148;
         curTarget = e.currentTarget as InteractiveObject;
         switch(e.type)
         {
            case NativeDragEvent.NATIVE_DRAG_ENTER:
               if(this._4186 != 1)
               {
                  this._4186 = 1;
                  transferable = e.clipboard;
                  if(transferable.hasFormat(ClipboardFormats.FILE_LIST_FORMAT))
                  {
                     data = transferable.getData(ClipboardFormats.FILE_LIST_FORMAT);
                     for each(f in data)
                     {
                        _3710++;
                        dragFile = f;
                     }
                     if(_3710 == 1)
                     {
                        extension = FileUtil.getExtension(dragFile.nativePath);
                        extension = extension.toLowerCase();
                        if(this._5146.indexOf(extension) != -1)
                        {
                           if(inWelcome && (extension != EXTENSION_PNG && extension != EXTENSION_JPG && extension != EXTENSION_PSD && extension != EXTENSION_SVG) || !inWelcome)
                           {
                              if(extension == EXTENSION_PNG || extension == EXTENSION_JPG)
                              {
                                 pngSize = _118._2380(dragFile.nativePath);
                                 if(pngSize && pngSize[0] <= _605.MAX_COMIC_WIDTH && pngSize[1] <= _605.MAX_COMIC_HEIGHT)
                                 {
                                    NativeDragManager.acceptDragDrop(curTarget);
                                    NativeDragManager.dropAction = NativeDragActions.MOVE;
                                 }
                              }
                              else
                              {
                                 NativeDragManager.acceptDragDrop(curTarget);
                                 NativeDragManager.dropAction = NativeDragActions.MOVE;
                              }
                           }
                           else if(!inWelcome && extension == EXTENSION_PSD)
                           {
                              if(!this._2861.hasFile(dragFile.nativePath))
                              {
                                 NativeDragManager.dropAction = NativeDragActions.COPY;
                                 NativeDragManager.acceptDragDrop(curTarget);
                              }
                           }
                        }
                     }
                     else if(_2220._2873 == _715.SHEET)
                     {
                        NativeDragManager.acceptDragDrop(curTarget);
                        NativeDragManager.dropAction = NativeDragActions.MOVE;
                     }
                  }
                  break;
               }
               return;
               break;
            case NativeDragEvent.NATIVE_DRAG_EXIT:
               this._4186 = 0;
               break;
            case NativeDragEvent.NATIVE_DRAG_DROP:
               this._4186 = 0;
               filePaths = [];
               transferable = e.clipboard;
               data = transferable.getData(ClipboardFormats.FILE_LIST_FORMAT);
               _3710 = 0;
               for each(file in data)
               {
                  dragFile = file;
                  _3710++;
               }
               if(_3710 == 1)
               {
                  extension = FileUtil.getExtension(dragFile.nativePath);
                  extension = extension.toLowerCase();
                  switch(extension)
                  {
                     case EXTENSION_JSON:
                     case EXTENSION_XML:
                     case EXTENSION_AMF3:
                        dirPath = FileUtil.getDirectory(dragFile.nativePath);
                        this._3227._5147(dragFile.nativePath);
                        _11110.instance._11131._11130(_11108.Drag);
                        break;
                     case EXTENSION_DBPROJECT:
                        _11110.instance._11564._11130(_11108.Drag);
                        _11110.instance._11564._11132();
                        _1567(new CommandNotification(CommandNotification.OPEN_AND_SELECT_PROJECT,dragFile.url));
                        break;
                     case EXTENSION_ZIP:
                        this._3227._3289(dragFile.nativePath);
                        _11110.instance._11131._11130(_11108.Drag);
                        break;
                     case EXTENSION_PNG:
                     case EXTENSION_JPG:
                        pngByte = FileUtil.openAsByteArray(dragFile.nativePath);
                        try
                        {
                           depressData = _34._1768(pngByte);
                           if(depressData._1756 != null && depressData._1748 != null)
                           {
                              this._3227._3289(dragFile.nativePath);
                              _11110.instance._11131._11130(_11108.Drag);
                           }
                           else if(!inWelcome && _2220._2873 != _715.ANIMATE)
                           {
                              _11110.instance._11619._11130(_11108.Drag);
                              _11110.instance._11619._11132();
                              this._5145(dragFile);
                           }
                        }
                        catch(e:Error)
                        {
                           if(!inWelcome && _2220._2873 != _715.ANIMATE)
                           {
                              _11110.instance._11619._11130(_11108.Drag);
                              _11110.instance._11619._11132();
                              _5145(dragFile);
                           }
                        }
                        break;
                     case EXTENSION_SVG:
                        try
                        {
                           if(!inWelcome && _2220._2873 != _715.ANIMATE)
                           {
                              this._2861._4532(e,function(param1:String):void
                              {
                                 var _loc2_:Number = _5141._4428.mouseX;
                                 var _loc3_:Number = _5141._4428.mouseY;
                                 _14637(param1,new Point(_loc2_,_loc3_));
                              });
                           }
                        }
                        catch(e:Error)
                        {
                        }
                        break;
                     case EXTENSION_PSD:
                        if(!inWelcome && _2220._2873 != _715.ANIMATE)
                        {
                           _14259.isExportData = true;
                           this._2861._4532(e);
                        }
                        break;
                     case EXTENSION_SWF:
                        try
                        {
                           if(!inWelcome && _2220._2873 != _715.ANIMATE)
                           {
                              this._2861._4532(e);
                           }
                        }
                        catch(e:Error)
                        {
                        }
                        break;
                     default:
                        try
                        {
                           this._3227._5147(dragFile.nativePath);
                           _11110.instance._11131._11130(_11108.Drag);
                        }
                        catch(e:Error)
                        {
                           _11110.instance._11204._11132("StageDragController::onDragIn::NativeDragEvent.NATIVE_DRAG_DROP::default",e);
                        }
                  }
               }
               else if(_2220._2873 == _715.SHEET)
               {
                  imageFiles = new Vector.<File>();
                  for each(imageFile in data)
                  {
                     extension = FileUtil.getExtension(imageFile.nativePath);
                     extension = extension.toLowerCase();
                     if(extension == EXTENSION_PNG || extension == EXTENSION_JPG || extension == EXTENSION_JPEG)
                     {
                        imageFiles.push(imageFile);
                     }
                  }
                  if(imageFiles.length > 0)
                  {
                     this._13239(imageFiles);
                  }
               }
         }
      }
      
      private function _14637(param1:String, param2:Point) : void
      {
         var _loc3_:_606 = _1407.getInstance(_606);
         _loc3_._14636(param1,param2);
      }
      
      private function _13239(param1:Vector.<File>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc7_:_725 = null;
         if(!this._2861._3678)
         {
            return;
         }
         var _loc4_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            this._13283(param1[_loc2_]);
            _loc4_.push(FileUtil.getFileName(param1[_loc2_].name));
            _loc2_++;
         }
         this._2861._4188();
         var _loc5_:Number = this._5141._4428.mouseX;
         var _loc6_:Number = this._5141._4428.mouseY;
         var _loc8_:Vector.<_725> = new Vector.<_725>();
         _loc2_ = 0;
         _loc3_ = int(_loc4_.length);
         while(_loc2_ < _loc3_)
         {
            _loc7_ = this._2106._3806(_loc4_[_loc2_]);
            if(_loc7_)
            {
               _loc8_.push(_loc7_);
            }
            _loc2_++;
         }
         if(_loc8_.length > 0)
         {
            _1567(new StageNotification(StageNotification.DRAG_IAMGES_TO_STAGE,{
               "imageFile":_loc8_,
               "position":new Point(_loc5_,_loc6_)
            }));
         }
      }
      
      private function _13283(param1:File) : void
      {
         var _loc2_:String = null;
         if(!this._2861._3678)
         {
            return;
         }
         _loc2_ = this._2861._3678._3680() + "/" + param1.name;
         _loc2_ = FileUtil.escapePath(_loc2_);
         var _loc3_:String = FileUtil.getFileName(_loc2_);
         if(Boolean(param1) && !this._2861.hasFile(param1.nativePath))
         {
            if(param1.size > LibraryPanelController.MAX_FILE_SIZE)
            {
               _1567(new TipNotification(TipNotification.TIP_ALERT,tr("LibraryPanel.error.outOfSize")));
               return;
            }
            this._2861.saveToLibrary(param1);
         }
      }
      
      private function _5145(param1:File) : void
      {
         var path:String;
         var posX:Number = NaN;
         var posY:Number = NaN;
         var fileName:String = null;
         var file:File = param1;
         if(!this._2861._3678)
         {
            return;
         }
         posX = this._5141._4428.mouseX;
         posY = this._5141._4428.mouseY;
         path = this._2861._3678._3680() + "/" + file.name;
         path = FileUtil.escapePath(path);
         fileName = FileUtil.getFileName(path);
         if(Boolean(file) && !this._2861.hasFile(file.nativePath))
         {
            if(file.size > LibraryPanelController.MAX_FILE_SIZE)
            {
               _1567(new TipNotification(TipNotification.TIP_ALERT,tr("LibraryPanel.error.outOfSize")));
               return;
            }
            if(!this._2861.saveFilesToLibrarySafely({0:file},function():void
            {
               _5144(fileName,posX,posY);
            }))
            {
               this._5144(fileName,posX,posY);
            }
         }
      }
      
      private function _5144(param1:String, param2:Number, param3:Number) : void
      {
         var _loc5_:_725 = null;
         var _loc6_:Object = null;
         var _loc7_:SymbolType = null;
         var _loc8_:_70 = null;
         var _loc9_:_52 = null;
         var _loc10_:String = null;
         var _loc11_:_79 = null;
         var _loc12_:Point = null;
         var _loc4_:Array = [];
         _loc5_ = this._2106._3806(param1);
         if(_loc5_)
         {
            _loc7_ = _2214._1844._2871._2865._1811;
            if(_loc7_ == SymbolType.ARMATURE)
            {
               _loc8_ = _70._2090(_loc5_);
               _loc9_ = this._5141._2762._1990;
               _loc10_ = _124._1747(_loc8_._2120,_loc9_.rootArmatureData._1996);
               _loc11_ = _79._1729(_loc10_,_loc9_);
               _loc6_ = _469._3482(_loc8_,this._5141._2762._1795.name,_loc11_,_loc9_,new Point(param2,param3));
               _1567(new CommandNotification(CommandNotification.ADD_DISPLAY_TO_BONE,_loc6_));
            }
            else if(_loc7_ == SymbolType.MC || SymbolType.STAGE || Boolean(SymbolType.COMIC))
            {
               _loc12_ = this._5141._4428.localToGlobal(new Point(param2,param3));
               _1567(new StageNotification(StageNotification.DRAG_IAMGE_TO_STAGE,{
                  "imageFile":_loc5_,
                  "position":_loc12_
               }));
            }
         }
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      private function get _2106() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
      
      private function get _3227() : _627
      {
         return _1407.getInstance(_627) as _627;
      }
   }
}

