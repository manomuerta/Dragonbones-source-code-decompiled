package _346
{
   import _1404._1407;
   import _18._21;
   import _472._622;
   import _51._71;
   import _648._665;
   import _721._722;
   import _755._757;
   import _755._760;
   import _755._761;
   import _783.TipNotification;
   import _93._92;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.filesystem.File;
   
   public class _358 extends _92
   {
      public function _358()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc3_:_665 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:File = null;
         var _loc9_:File = null;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc12_:String = null;
         var _loc13_:int = 0;
         var _loc14_:String = null;
         var _loc1_:_722 = _2223 as _722;
         var _loc2_:String = _loc1_.projectPath;
         if(FileUtil.exists(_loc2_))
         {
            _loc8_ = new File(_loc2_);
            _loc9_ = _loc8_.parent;
            _loc10_ = _loc8_.name.substr(0,_loc8_.name.length - _loc8_.extension.length - 1);
            _loc11_ = _loc8_.extension;
            _loc13_ = 1;
            do
            {
               _loc12_ = _loc10_ + "_" + String(_loc13_++) + "." + _loc11_;
            }
            while(_loc8_ = _loc9_.resolvePath(_loc12_), _loc8_.exists);
            
            _loc2_ = FileUtil.escapePath(_loc8_.nativePath);
         }
         if(!_665._3272(_loc2_))
         {
            this._3281._1567(new TipNotification(TipNotification.TIP_ALERT,tr("Import.error.fail")));
            return;
         }
         if(!_loc1_.saveFile())
         {
            this._3281._1567(new TipNotification(TipNotification.TIP_ALERT,tr("Import.error.fail")));
            return;
         }
         _loc3_ = _loc1_._2871;
         _loc3_.projectPath = _loc2_;
         _loc3_._3286 = _760._1630({
            "cY":0,
            "cX":0,
            "filter":{
               "visibleFilter":{
                  "image":1,
                  "slots":[],
                  "bones":[],
                  "armatures":[],
                  "bone":1
               },
               "selectableFilter":{
                  "image":1,
                  "slots":[],
                  "bones":[],
                  "armatures":[],
                  "bone":1
               }
            },
            "zoom":1
         });
         _loc3_._2824 = _761._1630({
            "autoRecordKeyFrame":0,
            "autoTween":1
         });
         _loc3_._1655 = new _21();
         var _loc4_:_71 = _loc1_._3274;
         _loc3_.init(_loc4_);
         var _loc5_:Object = {};
         _loc6_ = 0;
         _loc7_ = int(_loc4_._2126.length);
         while(_loc6_ < _loc7_)
         {
            _loc14_ = _loc4_._2126[_loc6_].name;
            _loc5_[_loc14_] = "library/";
            _loc6_++;
         }
         _loc3_.libraryData = new _757(_loc5_,_loc2_);
         _loc3_.save();
      }
      
      protected function get _3281() : _622
      {
         return _1407.getInstance(_622) as _622;
      }
   }
}

