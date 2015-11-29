[33mcommit 140aad3807893fcd73c76ffecce54fb9929d1286[m
Author: nguyenduoc <nguyenduoc.smile@gmail.com>
Date:   Thu Nov 12 22:18:38 2015 +0700

    Tooi la nguyenduoc

[1mdiff --git a/VideoLessionAdapter.java b/VideoLessionAdapter.java[m
[1mnew file mode 100644[m
[1mindex 0000000..a447b5f[m
[1m--- /dev/null[m
[1m+++ b/VideoLessionAdapter.java[m
[36m@@ -0,0 +1,137 @@[m
[32m+[m[32mpackage vieted.com.xpeak.adapter;[m
[32m+[m
[32m+[m[32mimport java.util.ArrayList;[m
[32m+[m[32mimport java.util.List;[m
[32m+[m
[32m+[m[32mimport vieted.com.xpeak.R;[m
[32m+[m[32mimport vieted.com.xpeak.model.SentenceModel;[m
[32m+[m[32mimport vieted.com.xpeak.widget.AnimatedExpandableListView.AnimatedExpandableListAdapter;[m
[32m+[m[32mimport android.content.Context;[m
[32m+[m[32mimport android.view.LayoutInflater;[m
[32m+[m[32mimport android.view.View;[m
[32m+[m[32mimport android.view.ViewGroup;[m
[32m+[m[32mimport android.widget.TextView;[m
[32m+[m
[32m+[m[32mpublic class VideoLessionAdapter extends AnimatedExpandableListAdapter {[m
[32m+[m
[32m+[m	[32mprivate LayoutInflater inflater;[m
[32m+[m
[32m+[m	[32mprivate List<GroupSentenceItem> items;[m
[32m+[m
[32m+[m	[32mpublic VideoLessionAdapter(Context context) {[m
[32m+[m
[32m+[m		[32minflater = LayoutInflater.from(context);[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mpublic void setData(List<GroupSentenceItem> items) {[m
[32m+[m		[32mthis.items = items;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32m@Override[m
[32m+[m	[32mpublic SentenceModel getChild(int groupPosition, int childPosition) {[m
[32m+[m		[32mreturn items.get(groupPosition).getSentenceItems().get(childPosition);[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32m@Override[m
[32m+[m	[32mpublic long getChildId(int groupPosition, int childPosition) {[m
[32m+[m		[32mreturn childPosition;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32m@Override[m
[32m+[m	[32mpublic View getRealChildView(int groupPosition, int childPosition,[m
[32m+[m			[32mboolean isLastChild, View convertView, ViewGroup parent) {[m
[32m+[m		[32mChildHolder holder;[m
[32m+[m		[32mSentenceModel item = getChild(groupPosition, childPosition);[m
[32m+[m		[32mif (convertView == null) {[m
[32m+[m			[32mholder = new ChildHolder();[m
[32m+[m			[32mconvertView = inflater[m
[32m+[m					[32m.inflate([m
[32m+[m							[32mR.layout.item_list_item_expandable_activity_video_introduce_lession,[m
[32m+[m							[32mparent, false);[m
[32m+[m			[32mholder.title = (TextView) convertView.findViewById(R.id.textTitle);[m
[32m+[m			[32mconvertView.setTag(holder);[m
[32m+[m		[32m} else {[m
[32m+[m			[32mholder = (ChildHolder) convertView.getTag();[m
[32m+[m		[32m}[m
[32m+[m		[32mholder.title.setText(item.getText());[m
[32m+[m
[32m+[m		[32mreturn convertView;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32m@Override[m
[32m+[m	[32mpublic int getRealChildrenCount(int groupPosition) {[m
[32m+[m		[32mreturn items.get(groupPosition).getSentenceItems().size();[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32m@Override[m
[32m+[m	[32mpublic GroupSentenceItem getGroup(int groupPosition) {[m
[32m+[m		[32mreturn items.get(groupPosition);[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32m@Override[m
[32m+[m	[32mpublic int getGroupCount() {[m
[32m+[m		[32mreturn items.size();[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32m@Override[m
[32m+[m	[32mpublic long getGroupId(int groupPosition) {[m
[32m+[m		[32mreturn groupPosition;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32m@Override[m
[32m+[m	[32mpublic View getGroupView(int groupPosition, boolean isExpanded,[m
[32m+[m			[32mView convertView, ViewGroup parent) {[m
[32m+[m		[32mGroupHolder holder;[m
[32m+[m		[32mGroupSentenceItem item = getGroup(groupPosition);[m
[32m+[m		[32mif (convertView == null) {[m
[32m+[m			[32mholder = new GroupHolder();[m
[32m+[m			[32mconvertView = inflater[m
[32m+[m					[32m.inflate([m
[32m+[m							[32mR.layout.item_group_expandable_activity_video_introduce_lesson,[m
[32m+[m							[32mparent, false);[m
[32m+[m			[32mholder.tvTitle = (TextView) convertView[m
[32m+[m					[32m.findViewById(R.id.textTitle);[m
[32m+[m
[32m+[m			[32mconvertView.setTag(holder);[m
[32m+[m
[32m+[m		[32m} else {[m
[32m+[m			[32mholder = (GroupHolder) convertView.getTag();[m
[32m+[m		[32m}[m
[32m+[m
[32m+[m		[32mholder.tvTitle.setText(item.title);[m
[32m+[m
[32m+[m		[32mreturn convertView;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32m@Override[m
[32m+[m	[32mpublic boolean hasStableIds() {[m
[32m+[m		[32mreturn true;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32m@Override[m
[32m+[m	[32mpublic boolean isChildSelectable(int arg0, int arg1) {[m
[32m+[m		[32mreturn true;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mpublic static class GroupSentenceItem {[m
[32m+[m		[32mpublic String title;[m
[32m+[m		[32mprivate List<SentenceModel> sentenceItems = new ArrayList<SentenceModel>();[m
[32m+[m
[32m+[m		[32mpublic List<SentenceModel> getSentenceItems() {[m
[32m+[m			[32mreturn sentenceItems;[m
[32m+[m		[32m}[m
[32m+[m
[32m+[m		[32mpublic void setSentenceItems(List<SentenceModel> sentenceItems) {[m
[32m+[m			[32mthis.sentenceItems = sentenceItems;[m
[32m+[m		[32m}[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mprivate static class ChildHolder {[m
[32m+[m		[32mTextView title;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mprivate static class GroupHolder {[m
[32m+[m		[32mTextView tvTitle;[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m[32m}[m
